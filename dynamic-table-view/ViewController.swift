//
//  ViewController.swift
//  dynamic-table-view
//
//  Created by Leonardo Oliveira on 27/07/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let meals = ["eggplant brownie", "zucchini muffin"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        print("view did load");
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int)->Int{
        return meals.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
        let row = indexPath.row;
        let meal = meals[row];
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil);
        cell.textLabel?.text = meal;
        return cell;
    }
}
