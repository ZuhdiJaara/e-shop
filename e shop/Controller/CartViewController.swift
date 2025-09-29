//
//  CartViewController.swift
//  e shop
//
//  Created by Zuhdi Jaara on 19/09/2025.
//

import UIKit
import NVActivityIndicatorView

class CartViewController: UIViewController {
    
    var user: User?
    var cart: Cart!
    var product: [CartProduct] = []
    @IBOutlet weak var checkOutButton: UIButton!{
        didSet{
            checkOutButton.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var loderView: NVActivityIndicatorView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var itemsPriceLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
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
    @IBOutlet weak var cartTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTabelView.dataSource = self
        cartTabelView.delegate = self
        cartTabelView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
        loderView.startAnimating()
        ProductsAPI.getCartByUser(id: 142) { cart in
            self.product = cart[0].products
            self.itemsLabel.text = "items(\(cart[0].totalQuantity))"
            self.itemsPriceLabel.text = "\(cart[0].total) $"
            self.totalPriceLabel.text = "\(cart[0].total) $"
            self.cartTabelView.reloadData()
            self.loderView.stopAnimating()
        }
        
//        if let user = UserManger.loggedInUser{
//            ProductsAPI.getCartByUser(id: user.id) { cart in
//                self.product = cart[0].products
//                self.itemsLabel.text = "items(\(cart[0].totalQuantity))"
//                self.itemsPriceLabel.text = "\(cart[0].total) $"
//                self.totalPriceLabel.text = "\(cart[0].total) $"
//                self.cartTabelView.reloadData()
//            }
//        }
        
    }
    
    
    
    
    @IBAction func checkOutButton(_ sender: Any) {
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        let cureentProduct = product[indexPath.row]
        cell.productNameLabel.text = cureentProduct.title
        cell.productPriceLabel.text = "\(cureentProduct.total) $"
        cell.productImageView.setImageFormStringUrl(cureentProduct.thumbnail)
        return cell
    }
    
    
}
