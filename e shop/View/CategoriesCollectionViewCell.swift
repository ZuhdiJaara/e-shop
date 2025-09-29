//
//  CategoriesCollectionViewCell.swift
//  e shop
//
//  Created by Zuhdi Jaara on 07/09/2025.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backLabelView: UIView!{
        didSet{
            backLabelView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var categoriesImageView: UIImageView!
    {
        didSet{
            categoriesImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var categoriesNameLabel: UILabel!
    
}
