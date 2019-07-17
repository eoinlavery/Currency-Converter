//
//  ViewController.swift
//  Currency Converter
//
//  Created by Eoin Lavery on 16/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currency: Currency!
    
    //Declare outlets
    @IBOutlet weak var currencyFromView: UIView!
    @IBOutlet weak var currencyToView: UIView!
    @IBOutlet weak var currencyFromTextField: UITextField!
    @IBOutlet weak var currencyToSymbol: UILabel!
    @IBOutlet weak var currencyToFlag: UIImageView!
    @IBOutlet weak var currencyToPrefix: UILabel!
    @IBOutlet weak var currencyToValue: UILabel!
    
    //Declare currencyFormatter
    var currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get symbol and add to title
        guard let convertToSymbol = currency?.symbol else { return }
        title = "USD to \(convertToSymbol)"
        
        //Set Background Color
        self.view.backgroundColor = UIColor(red: 0, green: 0.5686, blue: 0.898, alpha: 1)
        
        //Set View Corner Radius
        currencyFromView.layer.cornerRadius = 20
        currencyToView.layer.cornerRadius = 20
        
        //Set currency to flag
        currencyToFlag.image = currency.flag
        
        //Set currency Symbol to symbol string
        currencyToSymbol.text = currency.symbol
        currencyToPrefix.text = currency.stringSymbol
        
        //Set default dollar rate for label
        currencyToValue.text = String(format: "%.2f", currency.rateToDollar)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        self.view.endEditing(true)
    }
    
    @IBAction func currencyFromDidChange(_ sender: Any) {
        
       guard let dollars: Double = Double(currencyFromTextField.text ?? "0") else { return }
        if currencyFromTextField.text?.isEmpty == true {
            currencyToValue.text = "0.00"
        } else {
            currencyToValue.text = String(format: "%.2f", convert(dollars: dollars))
        }
    }
    
    func convert(dollars: Double) -> Double {
        return dollars * currency.rateToDollar
    }
}

