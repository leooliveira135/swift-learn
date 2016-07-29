//
//  ViewController.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 17/06/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import UIKit

protocol AddAMealDelegate{
    func add(meal: Meal);
}

protocol UITableViewDataSource: NSObjectProtocol{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
}

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    var items = [
        Item(name: "Eggplant Brownie", calories: 10),
        Item(name: "Zucchini Muffin", calories: 10),
        Item(name: "Cookie", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000)
    ];

    override func viewDidLoad() {
        super.viewDidLoad();
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("showNewItem"));
        navigationItem.rightBarButtonItem = newItemButton;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var happinessField: UITextField!
    var delegate:AddAMealDelegate?
    
    @IBAction func add(){
        if let meal = getMealFromForm(){
            if let meals = delegate{
                meals.add(meal);
                
                if let navigation = self.navigationController{
                    navigation.popViewControllerAnimated(true);
                }
                else{
                    Alert(controller: self).show("Unexpected error, but the meal was added.");
                }
                
                return;
            }
        }
        Alert(controller: self).show();
    }
    
    func getMealFromForm()->Meal?{
        if nameField == nil || happinessField == nil{
            return nil;
        }
        let name = self.nameField!.text;
        let happiness = Int(self.happinessField!.text!);
        if happiness == nil || happiness > 5{
            return nil;
        }
        let meal = Meal(name: name!, happiness: happiness!);
        meal.items = selected;
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)");
        return meal;
    }
    
    @IBAction func showNewItem(){
        let newItem = NewItemViewController(delegate: self);
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true);
        }
        else{
            Alert(controller: self).show();
        }
    }
    
    @IBOutlet weak var tableView: UITableView?
    func addNew(item: Item) {
        items.append(item);
        if let table = tableView{
            table.reloadData();
        }
        else{
            Alert(controller:self).show("Unexpected error, but the item was added");
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let item = items[row];
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil);
        
        cell.textLabel?.text = item.name;
        return cell;
    }
    
    var selected = Array<Item>();
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath);
        if cell == nil{
            return;
        }
        if(cell!.accessoryType == UITableViewCellAccessoryType.None){
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark;
            selected.append(items[indexPath.row]);
        }
        else{
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            if let position = find(selected, toFind: items[indexPath.row]){
                selected.removeAtIndex(position);
            }
        }
    }
    
    func find(elements:Array<Item>, toFind:Item)->Int?{
        let max = elements.count-1;
        for i in 0...max{
            if toFind == elements[i]{
                return i;
            }
        }
        return nil;
    }
}

