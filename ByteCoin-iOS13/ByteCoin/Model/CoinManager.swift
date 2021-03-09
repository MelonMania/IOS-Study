//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    var delegate : CoinModelDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F5EDF9C8-7E8A-43A6-813F-943AE4FE953A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    //    func getCoinPrice(for currency: String) -> Int {
    //    }
    
    func fetchURL(_ currency : String) {
        let updatedURL = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: updatedURL)
    }
    
    func performRequest(with urlString : String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    DispatchQueue.main.async {
                        if let coinData = parseJSON(data: safeData){
                            delegate?.didUpdateRate(coinData)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
   
    
    func parseJSON(data : Data) -> CoinModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let rate = decodedData.rate
            let currency = decodedData.asset_id_quote
            
            let coin = CoinModel(rate: rate, currency: currency)
            return coin
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
