//
//  ResultViewController.swift
//  Tipsy
//
//  Created by RooZin on 2021/03/02.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculateResult : Float?
    var dividePerson :String?
    var pct : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.1f", calculateResult ?? 0.0)
        settingsLabel.text = "Split between \(dividePerson!) people, with \(pct!) tip."
    }
    

    @IBAction func recaculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
