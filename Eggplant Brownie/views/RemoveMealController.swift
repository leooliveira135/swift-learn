//
//  RemoveMealController.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 28/07/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller;
    }
    
    func show(meal:Meal, handler:(UIAlertAction!)->Void){
        
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.Alert);
        
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: handler);
        details.addAction(remove);
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil);
        details.addAction(cancel);
        
        controller.presentViewController(details, animated: true, completion: nil);
    }

}