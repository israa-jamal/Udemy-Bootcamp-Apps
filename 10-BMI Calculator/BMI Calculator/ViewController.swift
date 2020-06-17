//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Esraa Gamal on 4/24/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var calcBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value)+"m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value)+"Kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        //calculate bmi
        calcBrain.calculateBMI(heightSlider.value, weightSlider.value)
        // go to bmi result view
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            //send bmi info to result view
            destinationVC.bmiValue = calcBrain.getBMI()
            destinationVC.color = calcBrain.getColor()
            destinationVC.advice = calcBrain.getAdvice()
        }
    }
}

