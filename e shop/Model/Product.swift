//
//  Products.swift
//  e shop
//
//  Created by Zuhdi Jaara on 08/09/2025.
//

import Foundation

struct Product: Decodable{
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Float
    let rating: Float
    let images: [String]
    let thumbnail: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation: String
    let shippingInformation: String
    let returnPolicy: String
    let reviews: [Reviews]
}

struct Dimensions: Decodable{
    let width: Float
    let height: Float
    let depth: Float
    
}

struct Reviews: Decodable{
    let rating: Float
    let comment: String
    let date: String
    let reviewerName: String
    
}
 
