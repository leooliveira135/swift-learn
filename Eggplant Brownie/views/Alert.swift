//
//  Alert.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 28/07/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    let controller:UIViewController;
    init(controller:UIViewController){
        self.controller = controller;
    }
    
    func show(message:String = "Unexpected error."){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil);
        
        alert.addAction(ok);
        controller.presentViewController(alert, animated: true, completion: nil);
    }
}