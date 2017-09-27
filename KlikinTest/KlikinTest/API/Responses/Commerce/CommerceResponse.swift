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

	}
}