//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by RooZin on 2021/02/28.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    
    var result : BMI?
    
    mutating func calculate(weight : Float, height : Float) {
        
        result?.value = weight / pow(height, 2)
    }
    
    mutating func getResult() -> String {
        let bmiValue = String(format: ".%1f", result?.value ?? 0.0)
        return bmiValue
    }
    
    
}
