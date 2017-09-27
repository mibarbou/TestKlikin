//
//  ThumbnailResponse.swift
//  KlikinTest
//
//  Created by Michel Barbou Salvador on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct ThumbnailsResponse: Gloss.Decodable {
    
    let small:      String?
    let medium:     String?
    let large:      String?
    
    init?(json: JSON) {
        self.small = "small" <~~ json
        self.medium = "medium" <~~ json
        self.large = "large" <~~ json
    }
}
