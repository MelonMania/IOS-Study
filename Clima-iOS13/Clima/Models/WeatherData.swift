//
//  WeatherData.swift
//  Clima
//
//  Created by RooZin on 2021/03/07.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name : String
    let main : Main
    var weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let description : String
    let id : Int
}
