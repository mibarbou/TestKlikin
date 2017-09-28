//
//  AddressResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct AddressResponse: Gloss.Decodable {
	
    let zip:        String?
    let city:       String?
    let country:    String?
    let street:     String?
    
	init?(json: JSON) {
        // some zip fields comes as Int, and others as String
        if let zip: Int = "zip" <~~ json {
            self.zip = String(zip)
        } else {
            self.zip = "zip" <~~ json
        }
        self.city = "city" <~~ json
        self.country = "country" <~~ json
        self.street = "street" <~~ json
	}
    
    func getAddress() -> Address {
        let zip = self.zip ?? ""
        let city = self.city ?? ""
        let country = self.country ?? ""
        let street = self.street ?? ""
        
        return Address(zip: zip,
                       city: city,
                       country: country,
                       street: street)
    }
}
