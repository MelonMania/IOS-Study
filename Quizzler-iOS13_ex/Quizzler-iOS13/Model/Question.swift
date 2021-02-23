//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by RooZin on 2021/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text : String
    var answer = [String]()
    let cA : String
    
    init(q : String, a : [String], correctAnswer : String){
        text = q
        answer.append(contentsOf: a)
        cA = correctAnswer
    }
}
