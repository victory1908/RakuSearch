//
//  APIRequest.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

public enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

public enum URLScheme: String {
    case http = "http"
    case https = "https"
}


protocol APIRequest {
    
    var scheme: URLScheme { get }
    var method: HTTPMethod { get }
    var host: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    
    var parameters: [String: Any] { get }
    
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeout: TimeInterval { get }
    
    var httpBodyData: Data? { get }
    var urlRequest: URLRequest? { get }
    
}

extension APIRequest {
    
    var urlRequest: URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.path = path
        
        if method == .GET {
            urlComponents.queryItems = parameters.map( { URLQueryItem(name: $0.key, value: "\($0.value)") } )
        }
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        if method == .POST, let httpBody = httpBodyData {
            urlRequest.httpBody = httpBody
        }
        
        headers.forEach( { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) } )
        urlRequest.timeoutInterval = timeout
        return urlRequest
    }
    
}
