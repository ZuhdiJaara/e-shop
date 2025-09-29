//
//  ReviewTableViewCell.swift
//  e shop
//
//  Created by Zuhdi Jaara on 16/09/2025.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.shadowColor = UIColor.black.cgColor
            backView.layer.shadowRadius = 4
            backView.layer.shadowOpacity = 0.4
            backView.layer.shadowOffset = CGSize(width: 0, height: 2)
            backView.layer.cornerRadius = 7
        }
    }
    
    @IBOutlet weak var ratingStarsView: CosmosView!{
        didSet{
            ratingStarsView.settings.updateOnTouch = false
            ratingStarsView.settings.fillMode = .precise
            ratingStarsView.settings.starSize = 15
        }
    }
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
