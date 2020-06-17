//
//  ViewController.swift
//  Clima
//
//  Created by Esraa Gamal on 4/28/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFieldLabel: UITextField!
    var weatherManger = WeatherManger()
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()
        weatherManger.delegate = self
        searchTextFieldLabel.delegate = self
    }

    @IBAction func shareLocationButton(_ sender: UIButton) {
        locationManger.requestLocation()
    }
}

//MARK:- TextFiledDelegate

extension ViewController : UITextFieldDelegate{
    
    @IBAction func searchButton(_ sender: UIButton) {
           searchTextFieldLabel.endEditing(true)
       }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFieldLabel.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManger.setCity(city)
        }
        searchTextFieldLabel.text = ""
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        }else
        {
            textField.placeholder = "Type something"
            return false
        }
        
    }
}

//MARK:- WeatherMangerDelegate


extension ViewController : WeatherMangerDelegate{
    
    func updateWeather(_ weatherManger : WeatherManger,weather : WeatherModel) {
        DispatchQueue.main.async{
            self.temperatureLabel.text = weather.tempString
            self.weatherImageView.image = UIImage(systemName: weather.condtionName)
            self.cityLabel.text = weather.cityName
            print(weather.cityName)
            print(weather.tempString)
        }
    }
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK:- CLLocationManagerDelegate

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last
        {
            locationManger.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManger.setCity(lat, lon)
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


