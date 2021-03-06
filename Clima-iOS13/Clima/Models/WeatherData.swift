//
//  WeatherData.swift
//  Clima
//
//  Created by RooZin on 2021/03/07.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let main : Main
    var weather : [Weather]
}

struct Main : Decodable {
    let temp : Double
}

struct Weather : Decodable {
    let description : String
}
