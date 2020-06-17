//
//  CalculateBmi.swift
//  BMI Calculator
//
//  Created by Esraa Gamal on 4/25/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
struct CalculatorBrain
{
    var bmi : BMI?
    mutating func calculateBMI(_ height : Float,_ weight : Float){
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5
        {
            bmi=BMI(value: bmiValue, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), advice: "Eat more pies!")
        } else if bmiValue < 24.9{
            
            bmi=BMI(value: bmiValue, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), advice: "Fit as a fiddle!")
        } else {
            
            bmi=BMI(value: bmiValue, color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), advice: "Eat less pies!")
        }
        
    }
    
    func getBMI() -> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "No Advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) 
    }
  
}
  
