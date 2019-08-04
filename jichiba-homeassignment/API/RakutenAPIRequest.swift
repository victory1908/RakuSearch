//
//  RakutenAPIRequest.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

struct RakutenAPIConstant {
    static let itemSearchPath = "/services/api/IchibaItem/Search/20170706"
}

protocol RakutenAPIRequest: APIRequest {
    var applicationId: String { get }
    var apiParameters: [String: Any] { get }
}

extension RakutenAPIRequest {
    
    var applicationId: String {
        return "1056349111375104157"
    }
    
    var scheme: URLScheme {
        get {
            return .https
        } set {
            
        }
    }
    
    var host: String {
        get {
            return "app.rakuten.co.jp"
        } set {
            
        }
    }
    
    var parameters: [String : Any] {
        get {
            var commonParameter = apiParameters
            commonParameter["format"] = "json"
            commonParameter["applicationId"] = applicationId
            commonParameter["formatVersion"] = 2
            return commonParameter
        } set {
            
        }
    }
    
}
