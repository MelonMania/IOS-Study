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

    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizBrain.index = 0
        quizBrain.count = 0
        quizBrain.reset = 0
        progressBar.progress = 0.0
        
        updateUI()
        choiceButton1.isHidden = false
        choiceButton2.isHidden = false
        choiceButton3.isHidden = false
    }
    

    @IBAction func pressAnwser(_ sender: UIButton) {
        quizBrain.checkAnswer(sender)

        if quizBrain.reset == 1{
            viewDidLoad()
        }
        else if  quizBrain.index >= quizBrain.quiz.count-1{
            scoreLabel.text = "score : \(quizBrain.count)"
            questionLabel.text = "Finished \n Your score : \(quizBrain.count)"
            progressBar.progress = 1.0
            choiceButton1.isHidden = true
            choiceButton2.setTitle("Replay", for: .normal)
            choiceButton2.backgroundColor = UIColor.clear
            choiceButton3.isHidden = true
            
            quizBrain.reset = 1
        }
        else{
            quizBrain.updateIndex()
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func updateUI() {
        questionLabel.text =  quizBrain.getQuestionText()
        choiceButtonSet()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "score : \(quizBrain.count)"
    }
    
    func choiceButtonSet() {
        let choiceArray = quizBrain.getChoice()
        choiceButton1.setTitle(choiceArray[0], for: .normal)
        choiceButton2.setTitle(choiceArray[1], for: .normal)
        choiceButton3.setTitle(choiceArray[2], for: .normal)
        
        choiceButton1.backgroundColor = UIColor.clear
        choiceButton2.backgroundColor = UIColor.clear
        choiceButton3.backgroundColor = UIColor.clear
    }
    

    

}
