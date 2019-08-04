//
//  QuickNetworking.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

class QuickNetworking: NSObject {
    
    enum NetworkError: Error {
        case requestInvalid
        case responseInvalid(Error?)
    }
    
    static func request<T: APIResponse>(_ apiRequest: APIRequest, completion: @escaping ((T?, Error?) -> Void)) {
        guard let urlRequest = apiRequest.urlRequest else {
            completion(nil, NetworkError.requestInvalid)
            return
        }
        URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            guard let data = data,
                  let response = try? T.parse(data: data, response: response, error: error) else {
                    completion(nil, NetworkError.responseInvalid(error))
                    return
            }
            completion(response, error)
        }.resume()
    }
    
}
