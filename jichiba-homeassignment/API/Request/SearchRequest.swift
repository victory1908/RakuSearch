//
//  SearchRequest.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

/**
 
 Sample API Request that you can use
 
 */
class SearchRequest: RakutenAPIRequest {
    
    var method: HTTPMethod = .GET
    var path: String = RakutenAPIConstant.itemSearchPath
    var headers: [String : String] = [:]
    var httpBodyData: Data? = nil
    
    var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    var timeout: TimeInterval = 30
    
    var keyword: String
    
    var page: Int
    
    /** Extra
    var page: Int
    var hits: Int
     */
    
    init(keyword: String, page: Int) {
        self.keyword = keyword
        self.page = page
    }
    
    var apiParameters: [String : Any] {
        return ["keyword": keyword, "page": page]
    }
    
}
