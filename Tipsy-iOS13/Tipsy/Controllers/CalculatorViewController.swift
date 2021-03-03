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
    
    
    var calculateBrain = CalculateBrain()
    
    var stepperValue : Float?
    var value : Value?
    var pct : Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        pct = calculateBrain.getPct(sender: sender)
        
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
        let total = Float(billTextField.text ?? "Error")
        
        value = calculateBrain.calculate(total: total!, pct: pct ?? 0.0, step: stepperValue ?? 0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultViewController
            let pctForprint = (value?.pctValue)! * 100
            destination.calculateResult = (value?.result) ?? 0.0
            destination.dividePerson = String(format : "%.0f", stepperValue ?? 0.0)
            destination.pct = String(format: "%.0f", pctForprint) + "%"
        }
        
    }
    
    
}

