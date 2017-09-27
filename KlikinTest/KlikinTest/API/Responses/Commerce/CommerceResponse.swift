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
}
