//
//  Commerce.swift
//  KlikinTest
//
//  Created by Michel Barbou Salvador on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct Commerce {
    
    let id:                     String
    let name:                   String
    let openingHours:           String
    let category:               String
    let description:            String
    let shortDescription:       String
    let address:                Address?
    let contact:                Contact?
    let location:               Location?
    let photos:                 [Photo]
    let features:               [String]?
}
