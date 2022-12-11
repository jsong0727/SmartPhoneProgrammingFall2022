//
//  DetailsViewController.swift
//  GetStockPrices
//
//  Created by Jiayin Song on 10/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class DetailsViewController: UIViewController {
    var symbol = ""
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDetails()
        // Do any additional setup after loading the view.
    }
    
    func getDetails(){
        print(symbol)
        let url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/getstock?symbol=\(symbol)"
        AF.request(url).responseJSON { responseData in
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            
            let stockJSON = JSON(responseData.data as Any)
            let stock = Stock()
            stock.companyName = stockJSON["CompanyName"].stringValue
            stock.symbol = stockJSON["Symbol"].stringValue
            stock.price = stockJSON["Price"].floatValue
            
            self.lblName.text = "Company Name: \(stock.companyName)"
            self.lblSymbol.text = "Company Symbol: \(stock.symbol)"
            self.lblPrice.text = "Stock Price: \(stock.price)"
            
        }
    }
}
