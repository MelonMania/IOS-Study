//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by RooZin on 2021/02/28.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    var bmiValue : String?
    var bmiAdvice : String?
    var bmiColor : UIColor?
 	
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        comment.text = bmiAdvice
        view.backgroundColor = bmiColor
    }
    
    
    @IBAction func recaculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
