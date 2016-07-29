//
//  Meal.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 17/06/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import Foundation

class Meal {
    let name:String;
    let happiness: Int;
    var items = Array<Item>();
    
    init(name:String, happiness:Int){
        self.name = name;
        self.happiness = happiness;
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
}

