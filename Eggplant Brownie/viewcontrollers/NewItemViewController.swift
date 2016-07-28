//
//  NewItemViewController.swift
//  Eggplant Brownie
//
//  Created by Leonardo Oliveira on 28/07/16.
//  Copyright © 2016 Leonardo Oliveira. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate{
    func addNew(item:Item);
}

class NewItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let delegate:AddAnItemDelegate?
    init(delegate:AddAnItemDelegate){
        self.delegate = delegate;
        super.init(nibName:"NewItemViewController", bundle: nil);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    
    @IBAction func addNewItem(sender: AnyObject) {
        if nameField == nil || caloriesField == nil{
            return;
        }
        
        let name = nameField.text;
        let calories = NSString(string: caloriesField!.text!).doubleValue;
        
        let item = Item(name: name!, calories: calories);
        
        if delegate == nil{
            return;
        }
        delegate!.addNew(item);
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true);
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
