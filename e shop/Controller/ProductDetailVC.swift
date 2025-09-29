//
//  ProductDetailVC.swift
//  e shop
//
//  Created by Zuhdi Jaara on 11/09/2025.
//

import UIKit
import NVActivityIndicatorView

class ProductDetailVC: UIViewController {
    
    var products: Product!
    var productImage: [String] = []
    var productId: Int?
    
    @IBOutlet weak var loderView: NVActivityIndicatorView!
    @IBOutlet weak var revieweSV: UIStackView!{
        didSet{
            revieweSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewStackViewTapped)))
        }
    }
    @IBOutlet weak var addToCartButton: UIButton!{
        didSet{
            addToCartButton.layer.cornerRadius = 16
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var shippingInformationLabel: UILabel!
    @IBOutlet weak var warrantyInformationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var returnPolicyLabel: UILabel!
    @IBOutlet weak var producrpriceLabel: UILabel!
    @IBOutlet weak var producrRatingLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImageCollectionView.delegate = self
        productImageCollectionView.dataSource = self
        
        loderView.startAnimating()
        if let id = productId {
            ProductsAPI.getSingelProduct(id: id) { products in
                self.products = products
                self.setupUI()
                self.loderView.stopAnimating()
            }
        }
        
        pageControl.numberOfPages = productImage.count
        
    }
    
    @objc func reviewStackViewTapped(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReviewsVC") as! ReviewsVC
        vc.products = products
        present(vc, animated: true)
    }
    
    func setupUI(){
        producrpriceLabel.text = "\(products.price) $"
        productNameLabel.text = products.title
        producrRatingLabel.text = "\(products.rating) / 5.00"
        productDescriptionLabel.text = products.description
        shippingInformationLabel.text = products.shippingInformation
        warrantyInformationLabel.text = products.warrantyInformation
        heightLabel.text = "\(products.dimensions.height)cm"
        widthLabel.text = "\(products.dimensions.width)cm"
        depthLabel.text = "\(products.dimensions.depth)cm"
        weightLabel.text = "\(products.weight).000kg"
        returnPolicyLabel.text = products.returnPolicy
        ratingLabel.text = "\(products.reviews[0].rating) / 5.00"
        commentLabel.text = products.reviews[0].comment
        reviewDate.text = products.reviews[0].date
        reviewerNameLabel.text = products.reviews[0].reviewerName
    }
    
    @IBAction func backbutton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension ProductDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productImageCell", for: indexPath) as! ProductDetailCollectionViewCell
        cell.ProductImages.setImageFormStringUrl(productImage[indexPath.row])
        pageControl.currentPage = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
