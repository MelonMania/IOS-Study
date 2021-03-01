//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    
    var calculatorBrain = CalculatorBrain()
    var bmi : BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderAction(_ sender: UISlider) {
        let height =  round(sender.value * 100) / 100
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderAction(_ sender: UISlider) {
        let weight = Int(round(sender.value))
        weightLabel.text = "\(weight)Kg"
        
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        bmi = calculatorBrain.calculate(weight: weight, height: height)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = calculatorBrain.getResult()
            destination.bmiAdvice = bmi?.adivce
            destination.bmiColor = bmi?.color
            
        }
    }
    
}

