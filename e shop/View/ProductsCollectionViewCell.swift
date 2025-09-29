//
//  ProductsCollectionViewCell.swift
//  e shop
//
//  Created by Zuhdi Jaara on 08/09/2025.
//

import UIKit
import Cosmos
class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var ratingStarsView: CosmosView!{
        didSet{
            ratingStarsView.settings.updateOnTouch = false
            ratingStarsView.settings.fillMode = .precise
            ratingStarsView.settings.starSize = 15
        }
    }
    
}
