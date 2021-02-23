//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by RooZin on 2021/02/23.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import UIKit


struct QuizBrain{
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var index : Int = 0
    var count : Int = 0
    var reset : Int = 0
    
    mutating func checkAnswer(_ sender : UIButton) {
        if sender.currentTitle! == quiz[index].cA{
            sender.backgroundColor = UIColor.green
            self.count += 1
        }
        else{
            sender.backgroundColor = UIColor.red
        }
    }
    
    func getQuestionText() -> String {
        return quiz[self.index].text
    }
    
    func getProgress() -> Float {
        return Float(self.index + 1)/Float(quiz.count)
    }
    
    func getChoice() -> Array<String> {
        return quiz[index].answer
    }
    
    mutating func updateIndex() {
        if self.index+1 < quiz.count{
            self.index += 1
        }
    }
}
