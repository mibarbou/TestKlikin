//
//  SocialResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct SocialResponse: Gloss.Decodable {
	
    let facebook:   String?
    
	init?(json: JSON) {
        self.facebook = "facebook" <~~ json
	}
}
