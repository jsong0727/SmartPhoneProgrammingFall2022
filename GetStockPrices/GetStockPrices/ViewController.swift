//
//  ViewController.swift
//  GetStockPrices
//
//  Created by Jiayin Song 10/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var stocks: [Stock] = [Stock]()
    var indexSelected = 0

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllValues()
        
    }
    
    func getAllValues() {
        
        var url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/allstocks"
    
        SwiftSpinner.show("Getting Stock Values")
        
        AF.request(url).responseJSON { responseData in
            
            SwiftSpinner.hide()
            
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            let stockData = JSON(responseData.data as Any)
            self.stocks = [Stock]()
            for stock in stockData {
                let str = Stock()
                let stockJSON = JSON(stock.1)
                str.companyName = stockJSON["CompanyName"].stringValue
                str.symbol = stockJSON["Symbol"].stringValue
                str.price = stockJSON["Price"].floatValue
                
                self.stocks.append(str)
            }
            self.tblView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDetails") {
            let destVC = segue.destination as! DetailsViewController
            let selectedStock = stocks[indexSelected]
            print(selectedStock)
            destVC.symbol = selectedStock.symbol
            //destVC.symbol = selectedStock
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(stocks[indexPath.row].companyName)(\(stocks[indexPath.row].symbol)): \(stocks[indexPath.row].price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        // Send the symbol  to next VC
        performSegue(withIdentifier: "segueDetails", sender: self)
    }
    
    
}

