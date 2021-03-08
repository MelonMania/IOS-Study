import UIKit
import CoreLocation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=664f067cac70f1ddb9a88dd5fb8b6d3e&units=metric"
    var delegate : WeatherModelDelegate?
        
    mutating func fetchURL(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with : urlString)
    }
    
    mutating func fetchURLdgree(lat : CLLocationDegrees, lon : CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with : urlString)
    }
    
    
    func performRequest(with urlString : String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailwithError(self, error: error!)
                    return
                }
                if let safeData = data {
                    DispatchQueue.main.async {
                        if let weather = self.parseJSON(safeData){
                            self.delegate?.transferWeather(self, weather : weather)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
       
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
        }
        catch{
            delegate?.didFailwithError(self, error: error)
            return nil
        }

    }
    
    

}
