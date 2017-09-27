//
//  ApiClient.swift
//  KlikinTest
//
//  Created by Michel on 27/09/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient {
	
	fileprivate static let baseURL: String = "https://s3-eu-west-1.amazonaws.com/developers-tests"

	static let manager: SessionManager = {
		return Alamofire.SessionManager.default
	}()
	
	fileprivate static let headers = ["Content-type": "application/x-www-form-urlencoded"]
	
	fileprivate enum Endpoints {
		
		case commerces
		
		fileprivate var method: Alamofire.HTTPMethod {
			switch self {
			case .commerces:
				return .get

			}
		}
		
		fileprivate var path: String {
			switch self {
			case .commerces:
				return baseURL + "/commerces.json"

			}
		}
		
		fileprivate var parameters: [String : String] {
			switch self {
			case .commerces:
				return [:]
				
			}
		}

	}
	
	
	fileprivate static func request(endpoint: ApiClient.Endpoints,
	                                success: @escaping ([[String: AnyObject]])->(),
	                                fail: @escaping (ApiError)->()) {
		
		let _ = ApiClient.manager.request(endpoint.path,
		                                        method: endpoint.method,
		                                        parameters: endpoint.parameters,
		                                        encoding: URLEncoding.default,
		                                        headers: headers).responseJSON { (response) in
													
													switch response.result {
														
													case .success(let json):
														if let json = json as? [[String: AnyObject]] {
															debugPrint(json)
															success(json)
														} else {
															fail(ApiError.parserError)
														}
														
													case .failure(let error):
														print("Request failed with error: \(error)")
														if let errorCode = response.error?._code,
															Int(errorCode) == -1009{
															fail(ApiError.noConnection)
														} else {
															fail(ApiError.unknownError)
														}
														
													}
		}
	}
}

//MARK: Public methods
extension ApiClient {
	
	public static func commerces(success: @escaping () -> (), fail: @escaping (ApiError) -> ()) {
		
		self.request(endpoint: .commerces, success: { (response) in
            
            if let commercesResponse = CommercesResponse(jsonArray: response as [AnyObject]),
                let commercesResp = commercesResponse.list {
                print(commercesResp)
            }
            
			success()
		}) { (error) in
			fail(error)
		}
		
	}
}





















