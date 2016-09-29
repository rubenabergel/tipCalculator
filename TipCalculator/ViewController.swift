//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ruben Abergel on 9/29/16.
//  Copyright © 2016 Ruben Abergel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    

    
    
    var tipPercentage =  [String]()
    
    func initTips(){
        tipPercentage =  []
        let defaults = UserDefaults.standard
        let firstTipValue = Float(defaults.integer(forKey:"firstTipValue"))
        let secondTipValue = Float(defaults.integer(forKey:"secondTipValue"))
        let thirdTipValue = Float(defaults.integer(forKey:"thirdTipValue"))
        
        tipPercentage.append(String(firstTipValue/100))
        tipPercentage.append(String(secondTipValue/100))
        tipPercentage.append(String(thirdTipValue/100))
        
        tipControl.setTitle(String(format: "%.0f%%", firstTipValue), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.0f%%", secondTipValue), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.0f%%", thirdTipValue), forSegmentAt: 2)
        defaults.synchronize()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTips()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        initTips()
        billField.becomeFirstResponder()
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0;
        
        let tip = Float(bill) * Float(tipPercentage[tipControl.selectedSegmentIndex])!
        let total = Float(bill)+Float(tip);
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
}

