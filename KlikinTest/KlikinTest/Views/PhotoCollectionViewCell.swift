//
//  PhotoCollectionViewCell.swift
//  KlikinTest
//
//  Created by Michel on 28/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit
import Kingfisher


class PhotoCollectionViewCell: UICollectionViewCell {
	
	static let cellIdentifier = "PhotoCell"

	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configureCellWith(photo: Photo) {
		let photoURL = photo.thumbnails?.large
		self.imageView.kf.setImage(with: photoURL)
	}

}
