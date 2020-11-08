//
//  CountryCell.swift
//  RealmExample
//
//  Created by Mahmoud Waked on 11/8/20.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var favImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
