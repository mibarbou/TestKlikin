//
//  ApiError.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

enum ApiError :Error {
	case serverError(message: String)
	case unknownError
	case parserError
	case noConnection
}
