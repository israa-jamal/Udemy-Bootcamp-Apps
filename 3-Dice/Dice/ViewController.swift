//
//  ViewController.swift
//  Dice
//
//  Created by mac on 4/21/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    let diceArray = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")] //array of all the faces of a dicee

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //choosing a random face of the both dice
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray.randomElement()
        
    }
    
}

