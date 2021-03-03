//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var pctValue : Float?
    var stepperValue : Float?
    var result : Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        if sender.currentTitle == "0%"{
            pctValue = 0.0
        }
        else if sender.currentTitle == "10%"{
            pctValue = 0.1
        }
        else{
            pctValue = 0.2
        }
        
        switch sender {
        case zeroPctButton:
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case tenPctButton:
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.stepValue = 1
        stepperValue = Float(sender.value)
        splitNumberLabel.text = String(format : "%.0f", stepperValue ?? 0.0)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = Float(billTextField.text!)
        result = (total! + (total! * pctValue!))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultViewController
            let pctForprint = pctValue! * 100
            destination.calculateResult = result
            destination.dividePerson = String(format : "%.0f", stepperValue ?? 0.0)
            destination.pct = String(format: "%.0f", pctForprint) + "%"
        }
        
    }
    
    
}

