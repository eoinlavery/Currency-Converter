//
//  CurrencyTableTableViewController.swift
//  Currency Converter
//
//  Created by Eoin Lavery on 16/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class CurrencyTableTableViewController: UITableViewController {

    var currencies: [Currency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Currencies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        currencies = createCurrencies()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell() }
        
        let currency: Currency = currencies[indexPath.row]
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = currency.stringSymbol
        
        cell.currencyImage.image = currency.flag
        cell.nameLabel.text = currency.name
        cell.symbolLabel.text = currency.symbol
        cell.conversionLabel.text = "\(currencyFormatter.string(from: NSNumber(value: currency.rateToDollar))!)"
        cell.conversionLabel.textColor = evaluateChange(forCurrency: currency)
        
        return cell
    }
 
    func evaluateChange(forCurrency: Currency) -> UIColor {
        
        switch forCurrency.todaysChange {
        case .hasDecreased:
            return UIColor.red
        case .hasIncreased:
            return UIColor.init(red: 0, green: 0.7, blue: 0, alpha: 1)
        case  .noChange:
            return UIColor.black
        }
    }
    
    func createCurrencies() -> [Currency] {
        let aud = Currency(name: "Australian Dollar", symbol: "AUD", currencyType: .aud, rateToDollar: 1.43, flag: UIImage.init(named: "audFlag")!, stringSymbol: "$", todaysChange: .hasDecreased)
        let gbp = Currency(name: "Great British Pound", symbol: "GBP", currencyType: .gbp, rateToDollar: 0.81, flag: UIImage.init(named: "gbpFlag")!, stringSymbol: "£", todaysChange: .hasIncreased)
        let cad = Currency(name: "Canadian Dollar", symbol: "CAD", currencyType: .cad, rateToDollar: 1.31, flag: UIImage.init(named: "cadFlag")!, stringSymbol: "$", todaysChange: .hasDecreased)
        let mxn = Currency(name: "Mexican Peso", symbol: "MXN", currencyType: .mxn, rateToDollar: 19.11, flag: UIImage.init(named: "mxnFlag")!, stringSymbol: "$", todaysChange: .hasDecreased)
        let eur = Currency(name: "Euro", symbol: "EUR", currencyType: .eur, rateToDollar: 0.89, flag: UIImage.init(named: "euroFlag")!, stringSymbol: "€", todaysChange: .noChange)
        
        return [gbp, cad, eur, aud, mxn]
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let selectedCurrency = currencies[selectedIndexPath.row]
        let detailVC = segue.destination as? ViewController
        detailVC?.currency = selectedCurrency
    }
    

}
