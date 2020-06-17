//
//  ViewController.swift
//  Egg Timer
//
//  Created by mac on 4/22/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player : AVAudioPlayer!
    @IBOutlet weak var labelShown: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    let eggTime = ["Soft": 300, "Medium": 420 , "Hard": 720] //the time an egg needs to reach a certain state in seconds
    var totalTime = 0 //total seconds an egg need
    var passedTime = 0 // total seconds passed
    var timer = Timer()
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        timer.invalidate() //reset the timer again to zero everytime we press the button
        let hardness = sender.currentTitle! // which state the user chose
        totalTime = eggTime[hardness]! // get the seconds needed from the dictionary
        
        progressView.progress = 0.0 //reset the progress bar to 0 when you change an egg state
        passedTime = 0 // reset time passed to 0
        labelShown.text = hardness //tell the user what state they chose
        
        //setting the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
        
        @objc func updateCounter() {
            
            if totalTime > passedTime {
                passedTime += 1
                let precentage = Float(passedTime)/Float(totalTime)
                progressView.progress = precentage // incress the progress bar according to the equation above
        }
            else{
                /*when the timer is up it's shown
                to the user that it's done,
                 it plays an alert and the timer resert to zero
                */
                playAlert()
                labelShown.text = "DONE!"
                timer.invalidate()
            }
    
        }
    func playAlert() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        //play the sound file from the addressed url
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
        
    }
    }


