//
//  WeatherData.swift
//  Clima
//
//  Created by Esraa Gamal on 4/28/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation
//JSON data
struct WeatherData : Codable {
    let name : String
    let main : Main
    
    let weather : [Weather] 
}
struct Main : Codable{
    let temp : Double
}
struct Weather : Codable
{
    let main : String
    let id : Int
}
