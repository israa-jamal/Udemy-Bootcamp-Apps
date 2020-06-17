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
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    
    
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
        //return buttons to its old color
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
        
        //get options from questions' array
        option1Button.setTitle(quizBrain.getOPtion1(), for: .normal)
        option2Button.setTitle(quizBrain.getOption2(), for: .normal)
        option3Button.setTitle(quizBrain.getOption3(), for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
}


