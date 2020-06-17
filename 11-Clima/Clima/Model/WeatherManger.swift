//
//  WeatherManger.swift
//  Clima
//
//  Created by Esraa Gamal on 4/28/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherMangerDelegate {
    func updateWeather(_ weatherManger : WeatherManger,weather : WeatherModel)
    func didFailWithError (_ error : Error)
}

struct WeatherManger {
    var delegate : WeatherMangerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9690a08a7ddb8a38b45573ea96f15d23&units=metric"
    func setCity(_ city: String){ //setting cityURL in case user wrote it
        let cityURL = "\(weatherURL)&q=\(city)"
        performRequest(cityURL)
    }
    
    func setCity(_ latitude : CLLocationDegrees,_ longitude : CLLocationDegrees){ //setting cityURL in case user used location
        let cityURL = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(cityURL)
    }

    func performRequest (_ urlString : String){
        //creating a url session for networking
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if  error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.updateWeather(self, weather : weather)
                    }
                }
            }
            task.resume()
        }
    }
    //decoding data from the url
    func parseJSON(_ weatherData: Data) ->WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(cityName: name, temperature: temp, condtionId:id)
            return weather
             
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
        
        
        }
    }
    


