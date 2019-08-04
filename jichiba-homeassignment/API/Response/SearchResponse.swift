//
//  SearchResponse.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

/**
 
 APIResponse Sample, feel free to add other properties if needed.
 
 */

struct SearchResponse: APIResponse, Codable {

    enum CodingKeys: String, CodingKey {
        case count
        case page
        case lastIndex = "last"
        case items = "Items"
    }
    
    let count: Int
    let page: Int
    let lastIndex: Int
    
    let items: [Item]
    
}
