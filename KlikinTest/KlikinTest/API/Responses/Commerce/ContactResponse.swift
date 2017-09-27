//
//  ContactResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct ContactResponse: Gloss.Decodable {
	
    let phone:      String?
    let email:      String?
    let web:        String?
    
	init?(json: JSON) {
        self.phone = "phone" <~~ json
        self.email = "email" <~~ json
        self.web = "web" <~~ json
	}
}
