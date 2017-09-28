//
//  CommerceDetailViewController.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit
import Kingfisher

class CommerceDetailViewController: UIViewController {
    
    let commerce: Commerce
	
	var photos: [Photo]
    
    @IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var streetLabel: UILabel!
	@IBOutlet weak var zipLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	
    init(commerce: Commerce) {
        
        self.commerce = commerce
        self.photos = commerce.photos
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupView() {
        self.nameLabel.text = self.commerce.name
		self.descriptionLabel.text = self.commerce.description
		let logoURL = self.commerce.logo?.thumbnails?.large
		self.logoImageView.kf.setImage(with: logoURL)
		self.categoryLabel.text = self.commerce.category
		self.streetLabel.text = self.commerce.address?.street
		self.zipLabel.text = self.commerce.address?.zip
		self.cityLabel.text = self.commerce.address?.city
		self.countryLabel.text = self.commerce.address?.country
		
		let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
		self.collectionView.register(nib, forCellWithReuseIdentifier: PhotoCollectionViewCell.cellIdentifier)
    }
}


extension CommerceDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.photos.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellIdentifier, for: indexPath) as! PhotoCollectionViewCell

		let photo = self.photos[indexPath.row]
		cell.configureCellWith(photo: photo)
		
		return cell
	}
}


















