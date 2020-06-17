//
//  WeatherModel.swift
//  Clima
//
//  Created by Esraa Gamal on 4/28/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation
//weather object
struct WeatherModel{
    let cityName : String
    let temperature : Double
    let condtionId : Int
    var tempString : String{
        String(format: "%.1f", temperature)
    }
    /* we take the id from the decoded data so we can knowthe condition of
    the weather so later we can choose the right image for it */
    var condtionName : String{
        switch condtionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
