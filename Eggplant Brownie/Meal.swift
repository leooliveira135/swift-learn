//
//  Meal.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 17/06/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {
    let name:String;
    let happiness: Int;
    var items = Array<Item>();
    
    init(name:String, happiness:Int){
        self.name = name;
        self.happiness = happiness;
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String;
        self.happiness = aDecoder.decodeObjectForKey("happiness") as! Int;
        self.items = aDecoder.decodeObjectForKey("items") as! Array<Item>;
    }
    
    func allCalories()->Double{
        print("Calculating");
        var total:Double = 0.00;
        
        for i in items{
            total = total + i.calories;
        }
        
        return total;
    }
    
    func details()->String{
        var message = "Happiness \(self.happiness)";
        
        for item in self.items{
            message = message + "\n * \(item.name) - calories: \(item.calories)";
        }
        
        return message;
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name");
        aCoder.encodeObject(self.happiness, forKey: "happiness");
        aCoder.encodeObject(self.items, forKey: "items");
    }
}

