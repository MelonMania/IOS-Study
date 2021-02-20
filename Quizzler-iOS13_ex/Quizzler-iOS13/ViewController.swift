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
    var reset : Int = 0
    
    let quiz = [
        ["Four + Two is equl to 6" , "True"],
        ["Five - Three is greater than One" , "True"] ,
        ["Three + Eight is less than Ten" , "False"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = 0
        updateUI()
        reset = 0
    }
    

    @IBAction func pressAnwser(_ sender: UIButton) {
        checkAnswer(sender: sender)
        if reset == 1{
            viewDidLoad()
        }
        else if index >= quiz.count-1{
            questionLabel.text = "Finished \n Your score : \(count)"
            progressBar.progress = 1.0
            reset = 1
        }
        else{
            index += 1
            updateUI()
            progressBar.progress = Float(index)/Float(quiz.count)
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[index][0]
    }
    
    func checkAnswer(sender : UIButton) {
        if sender.currentTitle! == quiz[index][1]{
            count += 1
        }
    }
        

}
