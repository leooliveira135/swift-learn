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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        if nameField == nil || happinessField == nil{
            return;
        }
        let name = self.nameField!.text;
        let happiness = Int(self.happinessField!.text!);
        if happiness == nil || happiness > 5{
            return;
        }
        let meal = Meal(name: name!, happiness: happiness!);
        print("eaten: \(meal.name) \(meal.happiness)");
        
        if delegate == nil{
            return;
        }
        delegate!.add(meal);
        
        if let navigation = self.navigationController{
            navigation.popViewControllerAnimated(true);
        }
    }
}

