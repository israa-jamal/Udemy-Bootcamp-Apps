//
//  ViewController.swift
//  Quizzer
//
//  Created by mac on 4/22/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // get user choice
        let result = quizBrain.checkAnswer(userAnswer) //true or false
        
        if result {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
       quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector (updateUI), userInfo: nil, repeats: false)
        /*a timer which lasts only 0.2 between every question
        so the user can see whether his answer right or wrong */
    }

    @objc func updateUI(){
        label.text = quizBrain.getQuestion() //print the question from the array in QuizBrain file
        progressBar.progress = quizBrain.getProgress() //ugrade progress
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        //return buttons to its old color in
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
}


