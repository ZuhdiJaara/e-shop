//
//  ProductsVC.swift
//  e shop
//
//  Created by Zuhdi Jaara on 08/09/2025.
//

import UIKit
import NVActivityIndicatorView

class ProductsVC: UIViewController {
    
    var porducts: [Product] = []
    var category: String?
    
    @IBOutlet weak var loderView: NVActivityIndicatorView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        loderView.startAnimating()
        ProductsAPI.getAllProducts(category: category) { product in
            self.porducts = product
            self.productsCollectionView.reloadData()
            self.loderView.stopAnimating()
        }
        
    }
    
    @IBAction func backbutton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension ProductsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        porducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductsCollectionViewCell
        let product = porducts[indexPath.row]
        cell.productNameLabel.text = product.title
        cell.productPriceLabel.text = "\(product.price) $"
        cell.ratingStarsView.rating = Double(product.rating)
        cell.productImageView.setImageFormStringUrl(product.thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = porducts[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        vc.productId = selectedProduct.id
        vc.productImage = porducts[indexPath.row].images
        present(vc, animated: true)
    }
    
}
