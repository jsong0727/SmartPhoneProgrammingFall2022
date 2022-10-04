//
//  ViewController.swift
//  Tourist App
//
//  Created by Jiayin Song on 10/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let cityNames = ["Miami", "Shenyang", "Rainier", "Vail", "Chicago"]
    
    @IBOutlet weak var TblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cell = Bundle.main.loadNibNamed("CityTableViewCell", owner: self)?.first as! CityTableViewCell
        cell.ImgCity.image = UIImage(named: cityNames[indexPath.row])
        cell.lblCity.text = cityNames[indexPath.row]
        
        return cell
    }


}

