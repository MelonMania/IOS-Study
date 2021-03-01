//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by RooZin on 2021/02/28.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var result : BMI?
    
    mutating func calculate(weight : Float, height : Float) -> BMI {
        let bmiResult = weight / pow(height, 2)
        let bmiColor = setColor(bmi: bmiResult)
        let bmiAdvice = setAdvice(bmi: bmiResult)
        result = BMI(value: bmiResult, adivce: bmiAdvice, color: bmiColor)
        
        return result ?? BMI(value: 0.0, adivce: "0.0", color: UIColor.black)
    }
    
    func getResult() -> String {
        let bmiValue = String(format: "%.1f", result?.value ?? 0.0)
        return bmiValue
    }
    
    func setAdvice(bmi : Float) -> String {
        let advice : String?
        
        if bmi < 18.5 {
            advice = "More eat~~~!"
        }
        else if bmi < 24.9 {
            advice = "Great Balance"
        }
        else{
            advice = "You are fat,,,"
        }
        
        return advice ?? "Error"
    }
    
    func setColor(bmi : Float) -> UIColor {
        let color : UIColor?
        
        if bmi < 18.5 {
            color = #colorLiteral(red: 0.3828087449, green: 0.8057613969, blue: 0.9951831698, alpha: 1)
        }
        else if bmi < 24.9 {
            color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
        else{
            color = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
        return color ?? UIColor.black
    }
    
    
}
