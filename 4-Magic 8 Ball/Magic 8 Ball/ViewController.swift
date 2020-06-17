//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by mac on 4/21/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ballArray = [#imageLiteral(resourceName:"ball1"),#imageLiteral(resourceName:"ball2"),#imageLiteral(resourceName:"ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")] //array of ball images

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func askButton(_ sender: UIButton) {
        imageView.image = ballArray.randomElement() //getting a random 8 ball
        
    }
}


