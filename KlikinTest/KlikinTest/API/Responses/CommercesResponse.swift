//
//  CommercesResponse.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct CommercesResponse: Gloss.Decodable {
	
    let list:  [CommerceResponse]?
    
    init?(jsonArray: [AnyObject]) {
        let jsonDictionary = ["list" : jsonArray]
        self.init(json: jsonDictionary)
    }
        
    init?(json: JSON) {
        guard let commerces: [CommerceResponse] = "list" <~~ json else {
            return nil
        }
        
        self.list = commerces
    }
    
    
    func getCommerces() -> [Commerce] {
        var commerces = [Commerce]()
        
        if let commercesList = self.list {
            commerces = commercesList.map{ $0.getCommerce() }
        }
        
        return commerces
    }
    
}
