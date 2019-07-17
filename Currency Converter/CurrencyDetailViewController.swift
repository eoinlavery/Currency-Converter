//
//  ViewController.swift
//  Currency Converter
//
//  Created by Eoin Lavery on 16/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class CurrencyDetailViewController: UIViewController {

    var currency: Currency!
    
    //Declare outlets
    @IBOutlet weak var currencyFromView: UIView!
    @IBOutlet weak var currencyToView: UIView!
    @IBOutlet weak var currencyFromTextField: UITextField!
    @IBOutlet weak var currencyToSymbol: UILabel!
    @IBOutlet weak var currencyToFlag: UIImageView!
    @IBOutlet weak var currencyToPrefix: UILabel!
    @IBOutlet weak var currencyToValue: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
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
        convertButton.layer.cornerRadius = 10
        convertButton.backgroundColor = UIColor.white
        convertButton.isEnabled = false
        convertButton.alpha = 0.5
        
        //Set currency to flag
        currencyToFlag.image = currency.flag
        
        //Set currency Symbol to symbol string
        currencyToSymbol.text = currency.symbol
        currencyToPrefix.text = currency.stringSymbol
        
        //Set default dollar rate for label
        currencyToValue.text = "0.00"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        convertButton.isEnabled = isConvertButtonEnabled(textField: currencyFromTextField)
        
        if convertButton.isEnabled == true {
            convertButton.alpha = 1
        } else {
            convertButton.alpha = 0.5
        }
        self.view.endEditing(true)
        
    }
    
    func isConvertButtonEnabled(textField: UITextField) -> Bool {
        if textField.text == "" {
            resetValueLabel()
            return false
        } else {
            return true
        }
    }
    
    func resetValueLabel() {
        currencyToValue.text = "0.00"
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        
        guard let dollars: Double = Double(currencyFromTextField.text ?? "0") else { return }
        
        currencyToValue.text = String(format: "%.2f", convert(dollars: dollars))
    }
    
    func convert(dollars: Double) -> Double {
        return dollars * currency.rateToDollar
    }
}

