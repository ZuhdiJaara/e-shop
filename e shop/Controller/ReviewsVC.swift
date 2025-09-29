//
//  ReviewsVC.swift
//  e shop
//
//  Created by Zuhdi Jaara on 16/09/2025.
//

import UIKit

class ReviewsVC: UIViewController {
    
    var products: Product!
    
    @IBOutlet weak var reviewsTablrView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewsTablrView.dataSource = self
        reviewsTablrView.delegate = self
    }
    
}

extension ReviewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell") as! ReviewTableViewCell
        let review = products.reviews[indexPath.row]
        cell.reviewerNameLabel.text = review.reviewerName
        cell.commentLabel.text = review.comment
        cell.ratingStarsView.rating = Double(review.rating)
        cell.reviewDateLabel.text = review.date
        return cell
    }
}
