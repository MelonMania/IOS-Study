//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
   

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        
    }
    
    
}


//MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != ""{
            searchTextField.placeholder = "Search"
            return true
        }
        else{
            searchTextField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        if let city = searchTextField.text{
            weatherManager.fetchURL(cityName: city)
        }
        
        searchTextField.text = ""
    
    }
}

//MARK: - WeatherModelDelegate

extension WeatherViewController : WeatherModelDelegate {
    func transferWeather(_ weatherManager : WeatherManager, weather : WeatherModel)  {
        temperatureLabel.text = weather.temperatureString
        cityLabel.text = weather.cityName
        conditionImageView.image = UIImage(systemName: weather.conditionName)
    }
    
    func didFailwithError(_ weatherManager: WeatherManager, error: Error) {
        print(error)
    }
}

//MARK: - CLLoactionManagerDelegate

extension WeatherViewController :  CLLocationManagerDelegate {
    
    @IBAction func pressCurrentLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchURLdgree(lat: lat, lon: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

}
