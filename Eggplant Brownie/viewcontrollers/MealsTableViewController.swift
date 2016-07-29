//
//  MealsTableViewController.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 27/07/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController,AddAMealDelegate {
    
    var meals = Array<Meal>();

    override func viewDidLoad() {
        let userDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true);
        let dir = getUserDir();
        let archive = "\(dir)/eggplant-bronwie-meals";
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(archive){
            self.meals = loaded as! Array;
        }
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let meal = meals[row];
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil);
        cell.textLabel!.text = meal.name;
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"));
        cell.addGestureRecognizer(longPress);
        
        return cell;
    }
    
    func add(meal: Meal){
        meals.append(meal);
        let userDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true);
        let dir = userDir[ 0 ] as String;
        let archive = "\(dir)/eggplant-bronwie-meals";
        NSKeyedArchiver.archiveRootObject(meals, toFile: archive);
        tableView.reloadData();
    }
    
    func getUserDir() -> String{
        let userDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        return userDir[ 0 ] as String;
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.Began{
            
            let cell = recognizer.view as! UITableViewCell;
            let indexPath = tableView.indexPathForCell(cell);
            if indexPath == nil{
                return;
            }
            
            let row = indexPath!.row;
            let meal = meals[row];

            RemoveMealController(controller: self).show(meal, handler: {
                action in
                self.meals.removeAtIndex(row);
                self.tableView.reloadData();
            });
            
            print("meal: \(meal.name) \(meal.happiness)");
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal"{
            let view = segue.destinationViewController as! ViewController;
            view.delegate = self;
        }
    }
}