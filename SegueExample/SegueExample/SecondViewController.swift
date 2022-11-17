//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Jiayin Song on 11/16/22.
//


import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = welcomeStr

    }
    
}
