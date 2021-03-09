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
    
    var baseURL = "https://rest.coinapi.io/v1/exchangerate"
    let apiKey = "6E240919-E924-4279-BEE9-17EBCF151966"
    
    let currencyArray = [["ETH","BTC","USD"],["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]]
    
 
    func fetchURL(coinName : String, currency : String) {
        let updatedURL = "\(baseURL)/\(coinName)/\(currency)?apikey=\(apiKey)"
        print(updatedURL)
        performRequest(with: updatedURL)
    }
    
    func performRequest(with urlString : String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in // Closure 이용
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    DispatchQueue.main.async { // 비동기
                        if let coinData = parseJSON(data: safeData){
                            delegate?.didUpdateRate(coinData)
                        }
                    }
                }
            }
            task.resume() // task 실행시 필수
        }
    }
    
    
    
    func parseJSON(data : Data) -> CoinModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let rate = decodedData.rate
            let currency = decodedData.asset_id_quote
            let coinName = decodedData.asset_id_base
            
            let coin = CoinModel(rate: rate, coinName: coinName, currency: currency)
            return coin
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
