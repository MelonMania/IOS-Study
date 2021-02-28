//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by RooZin on 2021/02/28.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    
    var result : String = "0.0"

    mutating func calculate(weight : Float, height : Float) {
        result = String(format : "%.1f", weight / pow(height, 2))
    }
    
    func getResult() -> String {
        return result
    }
    
    
}
