//
//  ViewController.swift
//  PromiseExample
//
//  Created by Jiayin Song on 11/17/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSymbol: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockValue(_ sender: Any) {
        let apiKey = "e3274c22b2fc4cdcbae825ef3964bcb9"
                
        var url = "https://financialmodelingprep.com/api/v3/quote/"
        url += txtSymbol.text!
        url += "?apikey="
        url += apiKey
        
        SwiftSpinner.show("Getting Stock Values")
        
        AF.request(url).responseJSON { responseData in
            print(responseData)
            
            SwiftSpinner.hide()
            
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            guard let stock = JSON(responseData.data!).array?.first else { return }
            
            print(stock["name"].stringValue)
            print(stock["price"].stringValue)
            
        }
    }
    
}

