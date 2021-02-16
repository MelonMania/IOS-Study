//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var index : Int = 0
    var count : Int = 0
    var question = [String]()
    let quiz = [
        "Four + Two is equl to 6" : true,
        "Five - Three is greater than One" : true ,
        "Three + Eight is less than Ten" : false
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getKey()
        updateUI()
    }
    

    @IBAction func pressAnwser(_ sender: UIButton) {
        let quest = question[index]
        if sender.currentTitle == "True" {
            if(quiz[quest] == true){
                count += 1
            }
        }
        else if sender.currentTitle == "False" {
            if(quiz[quest] == false){
                    count += 1
            }
        }
        index += 1
        if index == quiz.count{
            questionLabel.text = "Finished \n Your Score : \(count)"

        }
        else{
            updateUI()
        }
        progressBar.progress = Float(index)/Float(quiz.count)
    }
    
        func updateUI() {
            questionLabel.text = question[index]
        }
        
        func getKey(){
            for (key,_) in quiz{
                question.append(key)
            }
            question.reverse()
        }
        
    



}
