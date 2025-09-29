//
//  HomeVC.swift
//  e shop
//
//  Created by Zuhdi Jaara on 07/09/2025.
//

import UIKit
import NVActivityIndicatorView

class CategoriesVC: UIViewController {
    
    var categories: [String] = []
    
    
    @IBOutlet weak var loderView: NVActivityIndicatorView!
    @IBOutlet weak var CategoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoriesCollectionView.delegate = self
        CategoriesCollectionView.dataSource = self
        
        loderView.startAnimating()
        CategorieAPI.getAllCategorie { cat in
            self.categories = cat
            self.CategoriesCollectionView.reloadData()
            self.loderView.stopAnimating()
        }
        
    }
    
}


extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCollectionViewCell
        let currentCategorie = categories[indexPath.row]
        cell.categoriesNameLabel.text = currentCategorie
        cell.categoriesImageView.image = UIImage(named: "\(currentCategorie)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategorie = categories[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductsVC") as! ProductsVC
        vc.category = selectedCategorie
        present(vc, animated: true)
    }
}
