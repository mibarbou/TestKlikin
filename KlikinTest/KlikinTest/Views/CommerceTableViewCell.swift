//
//  CommerceTableViewCell.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit


class CommerceTableViewCell: UITableViewCell {

	static let cellIdentifier = "CommerceCell"
	
	@IBOutlet weak var nameLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWith(commerce: Commerce) {
        
        self.nameLabel.text = commerce.name
    }
    
}
