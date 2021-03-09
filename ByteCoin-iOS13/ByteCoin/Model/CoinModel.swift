//
//  CoinModel.swift
//  ByteCoin
//
//  Created by RooZin on 2021/03/09.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinModelDelegate {
    func didUpdateRate(_ coin : CoinModel)
    func didFailWithError(_ error : Error)
}

struct CoinModel {
    let rate : Float
    let coinName : String
    let currency : String
    
    var rateToString : String{
        return String(format : "%.3f", rate)
    }
}
