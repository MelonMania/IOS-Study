//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by RooZin on 2021/03/03.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct CalculateBrain{
    
    var value : Value?
    var pct : Float?
    
    mutating func getPct(sender : UIButton) -> Float {
        if sender.currentTitle == "0%"{
            pct = 0.0
        }
        else if sender.currentTitle == "10%"{
            pct = 0.1
        }
        else{
            pct = 0.2
        }
        
        return pct ?? 0.0
    }
    
    
    mutating func calculate(total : Float, pct : Float, step : Float) -> Value{
        let result = (total + (total * pct)) / step
        value = Value(result: result, pctValue: pct)
        
        return value ?? Value(result: 0.0, pctValue: 0.0)
    }
 
    
    
    
    
    
    
}

