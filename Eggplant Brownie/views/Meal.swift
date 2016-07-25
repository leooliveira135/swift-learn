//
//  Meal.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 17/06/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let happiness: Int
    var items: Array<Item>()
    
    init(name:String, happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories()->Double{
        println("Calculating")
        var total = 0
        
        for i in items{
            total += i.calories
        }
        
        return total
    }
}

