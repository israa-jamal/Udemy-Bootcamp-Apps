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
    init(q: String , a:String) {
        text = q
        answer = a
    }
}
