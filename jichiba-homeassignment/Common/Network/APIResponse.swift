//
//  APIResponse.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

protocol APIResponse {
    static func parse(data: Data, response: URLResponse?, error: Error?) throws -> Self
}

extension APIResponse where Self: Codable {
    
    static func parse(data: Data, response: URLResponse?, error: Error?) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
    
}
