//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Esraa Gamal on 4/24/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue : String?
    var color : UIColor?
    var advice : String?
    
    override func viewDidLoad() {
        //show bmi info on the screen
        super.viewDidLoad()
        resultLabel.text = bmiValue
        view.backgroundColor = color
        adviceLabel.text = advice
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        //go back to the previous view
    }
    
}
