//
//  CartTableViewCell.swift
//  e shop
//
//  Created by Zuhdi Jaara on 19/09/2025.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var mainBackView: UIView!{
        didSet{
            mainBackView.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
