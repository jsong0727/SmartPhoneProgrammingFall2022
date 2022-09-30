//
//  ViewController.swift
//  MyFavourite Food
//
//  Created by Jiayin Song on 9/30/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tblView: UITableView!
    
    let foodlist = ["pizza", "ice-cream", "tofu", "hotpot", "sushi", "BBQ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foodlist[indexPath.row]
        
        return cell
    }
}

