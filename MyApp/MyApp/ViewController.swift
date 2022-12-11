//
//  ViewController.swift
//  MyApp
//
//  Created by Jiayin Song on 12/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let foodNames = ["Burger", "Salad", "Sushi", "Pizza", "Taco"]
    
    

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("FoodTableViewCell", owner: self)?.first as! FoodTableViewCell
        cell.imgFood.image = UIImage(named: foodNames[indexPath.row])
        cell.lblFood.text = foodNames[indexPath.row]
        return cell
    }


}

