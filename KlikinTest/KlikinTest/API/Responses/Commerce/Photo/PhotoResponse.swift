//
//  PhotoResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct PhotoResponse: Gloss.Decodable {
	
    let id:         String
    let url:        String?
    let format:     String?
    let thumbnails:  ThumbnailsResponse?
    
	init?(json: JSON) {
        guard let id: String = "_id" <~~ json else {
            return nil
        }
        self.id = id
        self.url = "url" <~~ json
        self.format = "format" <~~ json
        self.thumbnails = "thumbnails" <~~ json
	}
}
