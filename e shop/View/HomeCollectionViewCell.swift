//
//  HomeCollectionViewCell.swift
//  e shop
//
//  Created by Zuhdi Jaara on 18/09/2025.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var homeImageView: UIImageView!{
        didSet{
            homeImageView.layer.cornerRadius = 20
        }
    }
    
}
