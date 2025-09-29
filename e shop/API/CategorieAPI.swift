//
//  CategorieAPI.swift
//  e shop
//
//  Created by Zuhdi Jaara on 07/09/2025.
//

import Foundation
import Alamofire
import SwiftyJSON

class CategorieAPI {
    
    static func getAllCategorie(completionHandler: @escaping ([String]) -> Void) {
        let url = "https://dummyjson.com/products/category-list"
        AF.request(url).responseJSON { response in
            let jsonData = JSON(response.value)
            let decoder = JSONDecoder()
            
            do{
                let categories = try decoder.decode([String].self, from: jsonData.rawData())
                completionHandler(categories)
            }catch let error{
                print(error)
            }
            
        }
    }
}
