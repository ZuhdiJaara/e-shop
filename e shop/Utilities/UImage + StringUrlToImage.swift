//
//  UImage + StringUrlToImage.swift
//  e shop
//
//  Created by Zuhdi Jaara on 08/09/2025.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFormStringUrl(_ stringUrl: String) {
       if let url = URL(string: stringUrl) {
            if let imageData = try? Data(contentsOf: url) {
                self.image = UIImage(data: imageData)
           }
        }
    }
}
