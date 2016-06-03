//
//  SettingsController.swift
//  SegundoObligatorio
//
//  Created by Diego Lázaro on 6/1/16.
//  Copyright © 2016 Universidad Catolica. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    

    
    @IBOutlet weak var unitChanger: UISegmentedControl!
    let prefs = NSUserDefaults.standardUserDefaults()
    //var selectedUnit = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
            unitChanger.selectedSegmentIndex =  self.prefs.integerForKey("selectedUnit")
        
       
    }
 
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    @IBAction func save(sender: AnyObject) {
        
        self.prefs.setInteger(unitChanger.selectedSegmentIndex, forKey: "selectedUnit")
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    
    
}



/*
 
 @IBAction indexChanged(sender:UISegmentedControl)
 {
 switch segmentedControl.selectedSegmentIndex
 {
 case 0:
 textLabel.text = "First selected";
 case 1:
 textLabel.text = "Second Segment selected";
 default:
 break;
 }
 */