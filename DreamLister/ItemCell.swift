//
//  ItemCell.swift
//  DreamLister
//
//  Created by Son Ho on 5/24/18.
//  Copyright © 2018 Son Ho. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

}
