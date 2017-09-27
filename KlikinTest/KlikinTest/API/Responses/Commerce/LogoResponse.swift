//
//  LogoResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct LogoResponse: Gloss.Decodable {
	
    let url:            String?
    let format:         String?
    let thumbnails:     ThumbnailsResponse?
    
	init?(json: JSON) {
        self.url = "url" <~~ json
        self.format = "format" <~~ json
        self.thumbnails = "thumbnails" <~~ json
	}
    
    
    func getLogo() -> Logo {
        
        let originalURL = URL(string: self.url ?? "")
        let format = self.format ?? ""
        
        var thumbnails: Thumbnails?
        if let thumbnailsResponse = self.thumbnails {
            thumbnails = thumbnailsResponse.getThumbnails()
        }
        
        return Logo(original: originalURL,
                    format: format,
                    thumbnails: thumbnails)
    }
}
