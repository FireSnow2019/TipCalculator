//
//  ViewController.swift
//  TipCalc
//
//  Created by Husain Taquee on 2017-08-15.
//  Copyright (c) 2017 Husain Taquee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrSelect: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var thumbsUp: UIButton!
    @IBOutlet weak var thumbsDown: UIButton!
    @IBOutlet weak var selectCurrency: UIPickerView!
    @IBOutlet weak var displaySelectedCurrency: UITextField!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var lblCurrCurrency: UITextField!
    
    
    var CurrencyList = ["USD","CAD","Pound"]
    var thumbsUpBtnCenter:CGPoint!
    var thumbsDownBtnCenter:CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [billField .becomeFirstResponder()]
        
        //more button functionality
        thumbsUpBtnCenter = thumbsUp.center
        thumbsDownBtnCenter = thumbsDown.center
        thumbsUp.center = moreBtn.center
        thumbsDown.center = moreBtn.center
        
        //end more button
        
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Begin coding for currency
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        
        return CurrencyList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        self.view.endEditing(true)
        return CurrencyList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        self.displaySelectedCurrency.text = self.CurrencyList[row]
            self.selectCurrency.hidden = true
            self.lblCurrSelect.hidden = true
            self.lblCurrCurrency.hidden = false
    }
    
    func textFieldDidBeginEditing(textField:UITextField)
    {
        if textField == self.CurrencyList
        {
            self.selectCurrency.hidden = false
        }
    }
    
    //End coding for currency
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func CalculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.25]
        
        //let billValue = Double(billField.text!)
        let bill = (billField.text! as NSString).doubleValue
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //toggle more button to show anim
    
    @IBAction func moreClicked(sender: UIButton) {
        
        
            UIView.animateWithDuration(0.3, animations: {
                //all annimation
                self.thumbsUp.hidden = false
                self.thumbsDown.hidden = false 
                self.thumbsUp.center = self.thumbsUpBtnCenter
                self.thumbsDown.center = self.thumbsDownBtnCenter
            })
            sender.hidden = true
       
        
    }
}

