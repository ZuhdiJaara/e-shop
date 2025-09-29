//
//  HomeVC.swift
//  e shop
//
//  Created by Zuhdi Jaara on 18/09/2025.
//

import UIKit
import SideMenu
import NVActivityIndicatorView

class HomeVC: UIViewController {
    
    var menu : SideMenuNavigationController!
    let homeImage = [UIImage(named: "tops"),UIImage(named: "groceries"),UIImage(named: "smartphones"),UIImage(named: "furniture")]
    var timer: Timer?
    var currentCellIndex = 0
    var porducts: [Product] = []
    var porductTopReted: [Product] = []
    var porductNearToYou: [Product] = []
    
    
    
    @IBOutlet weak var loderView: NVActivityIndicatorView!
    @IBOutlet weak var topRatedSV: UIStackView!{
        didSet{
            topRatedSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(proStackViewTapped)))
        }
    }
    @IBOutlet weak var nearToYouSV: UIStackView!{
        didSet{
            nearToYouSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(proStackViewTapped)))
        }
    }
    @IBOutlet weak var nearToYouCollectionView: UICollectionView!
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loderView.startAnimating()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        
        nearToYouCollectionView.delegate = self
        nearToYouCollectionView.dataSource = self
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
        
        ProductsAPI.getAllProducts(category: nil) { product in
            self.porducts = product
            self.porductTopReted = [self.porducts[0],self.porducts[4],self.porducts[9],self.porducts[14],self.porducts[19]]
            self.porductNearToYou = [self.porducts[1],self.porducts[5],self.porducts[10],self.porducts[15],self.porducts[20]]
            self.topRatedCollectionView.reloadData()
            self.nearToYouCollectionView.reloadData()
            self.loderView.stopAnimating()
        }
        
        searchBar.delegate = self
        
        pageControl.numberOfPages = homeImage.count
        startTimer()
        
    
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(moveToNextImage), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextImage(){
        
        if currentCellIndex < homeImage.count - 1 {
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        pageControl.currentPage = currentCellIndex
        
        homeCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    @objc func proStackViewTapped(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductsVC") as! ProductsVC
        present(vc, animated: true)
    }
    
    @IBAction func menuBatButton(_ sender: UIButton) {
        present(menu, animated: true)
    }
    

    
 
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
            
        case homeCollectionView:
            homeImage.count
            
        case topRatedCollectionView:
            porductTopReted.count

        default:
            porductNearToYou.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
            
        case homeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
            cell.homeImageView.image = homeImage[indexPath.row]
            return cell
            
        case topRatedCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedCell", for: indexPath) as! topRatedCollectionViewCell
            cell.productNameLavel.text = porductTopReted[indexPath.row].title
            cell.productImageView.setImageFormStringUrl(porductTopReted[indexPath.row].thumbnail)
            cell.productPriceButton.setTitle("\(porductTopReted[indexPath.row].price)", for: .normal)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nearToYouCell", for: indexPath) as! nearToYouCollectionViewCell
            cell.productNameLavel.text = porductNearToYou[indexPath.row].title
            cell.productImageView.setImageFormStringUrl(porductNearToYou[indexPath.row].thumbnail)
            cell.productPriceButton.setTitle("\(porductNearToYou[indexPath.row].price)", for: .normal)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView{
        case homeCollectionView:
            0
        default:
            10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case homeCollectionView:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        default:
            return CGSize(width: 115, height: 178)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView{
        case topRatedCollectionView:
            goToProductDetail(porduct: porductTopReted[indexPath.row])
        case nearToYouCollectionView:
            goToProductDetail(porduct: porductNearToYou[indexPath.row])
        default:
           break
        }
    }
    
    func goToProductDetail(porduct: Product){
        let selectedProduct = porduct
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        vc.productId = selectedProduct.id
        vc.productImage = porduct.images
        present(vc, animated: true)
    }
}

extension HomeVC: UISearchBarDelegate {
   
}
