//
//  Question.swift
//  Quizzer
//
//  Created by mac on 4/23/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    let options : [String]
    init(q: String , a:[String], correctAnswer : String) {
        text = q
        options = a
        answer = correctAnswer
        
    }
}
