//
//  CommerceResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct CommerceResponse: Gloss.Decodable {
	
	let id:						String
	let name: 					String?
	let openingHours:			String?
	let category:				String?
	let description:			String?
	let shortDescription:		String?
    let address:                AddressResponse?
    let contact:                ContactResponse?
    let location:               [Double]?
    let photos:                 [PhotoResponse]?
    let features:               [String]?
	
	init?(json: JSON) {
		
		guard let id: String = "_id" <~~ json else {
			return nil
		}
		self.id = id
		
		self.name = "name" <~~ json
		self.openingHours = "openingHours" <~~ json
		self.category = "category" <~~ json
		self.description = "description" <~~ json
		self.shortDescription = "shortDescription" <~~ json
        self.address = "address" <~~ json
        self.contact = "contact" <~~ json
        self.location = "location" <~~ json
        self.photos = "photos" <~~ json
        self.features = "features" <~~ json

	}
    
    func getCommerce() -> Commerce {
        let id = self.id
        let name = self.name ?? ""
        let openingHours = self.openingHours ?? ""
        let category = self.category ?? ""
        let description = self.description ?? ""
        let shortDescription = self.shortDescription ?? ""
        
        var address: Address?
        if let addressResponse = self.address {
            address = addressResponse.getAddress()
        }
        
        var contact: Contact?
        if let contactResponse = self.contact {
            contact = contactResponse.getContact()
        }
        
        var latitude: Double = -1
        var longitude: Double = -1
        if let locationsArray = self.location,
            locationsArray.count >= 2 {

            latitude = locationsArray[0]
            longitude = locationsArray[1]
        }
        let location = Location(latitude: latitude,
                                longitude: longitude)
        
        var photos = [Photo]()
        if let photosResponse = self.photos {
            photos = photosResponse.map{ $0.getPhoto() }
        }
        
        var features = [String]()
        if let featuresResponse = self.features {
            features = featuresResponse.map{ $0 }
        }
        
        
        return Commerce(id: id,
                        name: name,
                        openingHours: openingHours,
                        category: category,
                        description: description,
                        shortDescription: shortDescription,
                        address: address,
                        contact: contact,
                        location: location,
                        photos: photos,
                        features: features)
    }
}









