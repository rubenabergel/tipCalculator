//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ruben Abergel on 9/29/16.
//  Copyright © 2016 Ruben Abergel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        var firstTipValue = defaults.string(forKey:"firstTipValue")
        var secondTipValue = defaults.string(forKey:"secondTipValue")
        var thirdTipValue = defaults.string(forKey:"thirdTipValue")
        
        if ( firstTipValue != nil ){
            firstTipField.text = firstTipValue
        }else{
            firstTipField.text = "15"
        }
        
        if ( secondTipValue != nil ){
            secondTipField.text = secondTipValue
        }else{
            secondTipField.text = "17"
        }
        
        if ( thirdTipValue != nil ){
            thirdTipField.text = thirdTipValue
        }else{
            thirdTipField.text = "20"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(firstTipField.text!, forKey: "firstTipValue")
        defaults.synchronize()
    }
    @IBAction func secondTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(secondTipField.text!, forKey: "secondTipValue")
        defaults.synchronize()
    }
    
    
    @IBAction func thirdTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(thirdTipField.text!, forKey: "thirdTipValue")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
