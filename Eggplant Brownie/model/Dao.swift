//
//  Dao.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 29/07/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import Foundation

class Dao {
    let mealsArchive: String;
    let itemsArchive: String;
    
    init(){
        let userDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        let dir = userDir[ 0 ] as String;
        mealsArchive = "\(dir)eggplant-brownie-meals/";
        itemsArchive = "\(dir)eggplant-brownie-items/";
    }
    
    func saveMeals(meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive);
    }
    
    func loadMeals()->Array<Meal>{
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive){
            return loaded as! Array;
        }
        
        return Array<Meal>();
    }
    
    func saveItems(items:Array<Item>){
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive);
    }
    
    func loadItems()->Array<Item>{
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive){
            return loaded as! Array;
        }
        
        return Array<Item>();
    }
}