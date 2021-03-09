//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var coinPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    var selectedCoin : String?
    var selectedCurrency : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        coinManager.delegate = self
    }
    
    
    @IBAction func pressCalc(_ sender: UIButton) {
        coinManager.fetchURL(coinName: selectedCoin!, currency: selectedCurrency!)
    }
    
    
}
//MARK: - UIPickerViewDelegate &UIPickerViewDataSource

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    // PickerView row 값 몇개씩 출력할지
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 배열로부터 row 값 초기화
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedCoin = coinManager.currencyArray[0][pickerView.selectedRow(inComponent: 0)]
        selectedCurrency = coinManager.currencyArray[1][pickerView.selectedRow(inComponent: 1)]

    }
    
    // UIPickerViewDataSource의 함수로 전체 뷰의 갯수를 정해준다.(picker의 갯수)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray[component].count
    }
    
    
}

//MARK: - CoinModelDelegate

extension ViewController : CoinModelDelegate {
    func didUpdateRate(_ coin: CoinModel) {
        bitcoinLabel.text = coin.rateToString
        currencyLabel.text = coin.currency
        coinNameLabel.text = "1 \(coin.coinName)"
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

