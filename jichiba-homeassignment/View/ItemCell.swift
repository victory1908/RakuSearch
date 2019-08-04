//
//  ItemCell.swift
//  jichiba-homeassignment
//
//  Created by victory1908 on 28/7/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCell: UITableViewCell {

    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shopLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configItemCell(item: Item) {
        nameLbl.text = item.name
        shopLbl.text = item.shop
        priceLbl.text = "\(item.price)"
        itemImage.kf.setImage(with: URL(string: item.mediumImageUrls[0]))
    }

}
