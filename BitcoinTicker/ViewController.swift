//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
   
   
   
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencyArraySymbols = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    var currentDisplayedIndex = 0

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        
       
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,titleForRow row: Int, forComponent component:Int) -> String?  {
       

        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,didSelectRow row: Int, inComponent component:Int) {
       
        currentDisplayedIndex = currencyPicker.selectedRow(inComponent: component)
        
        
        finalURL = baseURL + currencyArray[row]
        
        getWeatherData(url: finalURL)
    }
    

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
    func getWeatherData(url: String) {
let headers: HTTPHeaders = [
    "x-ba-key":"MDJmNjhmMTljM2QyNGQzYjllNTVmNDIzZjZiZThiM2Q"
    ]
        
        AF.request(url,method: .get,headers: headers).responseDecodable(of: BitcoinDataModel.self) {response in
            
            if response.response?.statusCode == 200{
                
                self.bitcoinPriceLabel.text = "\(response.value!.ask) \(self.currencyArraySymbols[self.currentDisplayedIndex])"
            }else {
                self.bitcoinPriceLabel.text = "Prices are unavailable!"
            }
            
        }

    }
  




}

