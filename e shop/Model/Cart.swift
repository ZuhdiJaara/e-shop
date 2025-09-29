//
//  Carts.swift
//  e shop
//
//  Created by Zuhdi Jaara on 23/09/2025.
//

import Foundation

struct Cart: Decodable{
    let products: [CartProduct]
    let total: Float
    let discountedTotal: Float
    let totalQuantity: Int
}

struct CartProduct: Decodable{
    let title: String
    let total: Float
    let quantity: Int
    let thumbnail: String
}
