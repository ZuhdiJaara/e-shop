//
//  ProductsAPI.swift
//  e shop
//
//  Created by Zuhdi Jaara on 08/09/2025.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductsAPI{
    
    static func getAllProducts(category:String?, completionHandler: @escaping ([Product]) -> Void) {
        
        var url = "https://dummyjson.com/products"
        
        if let category = category {
            url = "https://dummyjson.com/products/category/\(category)"
        }
        
        
        AF.request(url).responseJSON { response in
            let jsonData = JSON(response.value)
            let data = jsonData["products"]
            let decoder = JSONDecoder()
            
            do{
                let products = try decoder.decode([Product].self, from: data.rawData())
                completionHandler(products)
            }catch let error{
                print(error)
            }
        }
    }
    
    static func getSingelProduct(id:Int, completionHandler: @escaping (Product) -> Void) {
        
        var url = "https://dummyjson.com/products/\(id)"
        
        
        AF.request(url).responseJSON { response in
            let jsonData = JSON(response.value)
            let decoder = JSONDecoder()
            
            do{
                let product = try decoder.decode(Product.self, from: jsonData.rawData())
                completionHandler(product)
            }catch let error{
                print(error)
            }
        }
    }
    
    static func getCartByUser(id:Int, completionHandler: @escaping ([Cart]) -> Void) {
        
        var url = "https://dummyjson.com/carts/user/\(id)"
        
        
        AF.request(url).responseJSON { response in
            let jsonData = JSON(response.value)
            let data = jsonData["carts"]
            let decoder = JSONDecoder()
            
            do{
                let cart = try decoder.decode([Cart].self, from: data.rawData())
                completionHandler(cart)
            }catch let error{
                print(error)
            }
        }
    }
}
