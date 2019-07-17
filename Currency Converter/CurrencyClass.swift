//
//  CurrencyClass.swift
//  Currency Converter
//
//  Created by Eoin Lavery on 16/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//
import UIKit
import Foundation

enum CurrencyType{
    case usd
    case cad
    case gbp
    case aud
    case mxn
    case eur
}

enum RateChange {
    case hasIncreased
    case hasDecreased
    case noChange
}

class Currency {
    var name: String
    var symbol: String
    var currencyType: CurrencyType
    var rateToDollar: Double
    var flag: UIImage
    var stringSymbol: String
    var todaysChange: RateChange
    
    init(name: String, symbol: String, currencyType: CurrencyType, rateToDollar: Double, flag: UIImage, stringSymbol: String, todaysChange: RateChange) {
        self.name = name
        self.symbol = symbol
        self.currencyType = currencyType
        self.rateToDollar = rateToDollar
        self.flag = flag
        self.stringSymbol = stringSymbol
        self.todaysChange = todaysChange
    }
    
}
