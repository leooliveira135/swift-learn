//
//  ViewController.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 17/06/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import UIKit

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
    
    @IBAction func add(){
        if nameField == nil || happinessField == nil{
            return;
        }
        let name = self.nameField!.text;
        let happiness = Int(self.happinessField!.text!);
        if happiness == nil{
            return;
        }
        let meal = Meal(name: name!, happiness: happiness!);
        print("eaten: \(meal.name) \(meal.happiness)");
    }
}

