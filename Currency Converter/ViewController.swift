//
//  ViewController.swift
//  Currency Converter
//
//  Created by Eoin Lavery on 16/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Declare outlets for labels and buttons
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    @IBOutlet weak var currencyToLabel: UILabel!
    @IBOutlet weak var currencyFromTextField: UITextField!
    @IBOutlet weak var currencyToTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Define CurrencyType Enum and  ddeclare variable to store current state
    var currencyType: CurrencyType?
    enum CurrencyType {
        case cad
        case peso
    }
    
    //Decalre functions for buttons and conversion
    @IBAction func convertButtonPressed(_ sender: Any) {
        
        guard let dollars: Double = Double(currencyFromTextField.text!),
                let currencyType: CurrencyType = currencyType else {
                    return
                }
        
        //Define currencyFormatter
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")
        
        currencyToTextField.text = currencyFormatter.string(from: NSNumber(value: convert(dollars: dollars, to: currencyType)))
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        currencyType = .cad
        cadButton.isSelected = true
        pesoButton.isSelected = false
    }
    
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        currencyType = .peso
        pesoButton.isSelected = true
        cadButton.isSelected = false
    }

    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        
        //Declare variable for exchange rates
        let cadRate: Double = 1.31
        let pesoRate: Double = 19.10
        
        switch unit {
        case .cad:
            return dollars * cadRate
        case .peso:
            return dollars * pesoRate
        }
    }
}

