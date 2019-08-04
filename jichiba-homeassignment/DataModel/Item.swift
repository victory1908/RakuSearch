//
//  Item.swift
//  jichiba-homeassignment
//
//  Created by Kerdkokaew, Peera | Mai | ECMD on 2019/03/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit

/**
 
 Please modify to add most properties which will be sufficient enough to serve the requirement.
 
 */
struct Item: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "itemName"
        case shop = "shopName"
        case price = "itemPrice"
        case smallImageUrls
        case mediumImageUrls
        case caption = "itemCaption"
    }
    
    let name: String
    let shop: String
    let price: Float
    let smallImageUrls: [String]
    let mediumImageUrls: [String]
    let caption: String
}
