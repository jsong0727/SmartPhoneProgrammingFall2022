//
//  CityTableViewCell.swift
//  Tourist App
//
//  Created by Jiayin Song on 10/3/22.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ImgCity: UIImageView!
    @IBOutlet weak var lblCity: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
