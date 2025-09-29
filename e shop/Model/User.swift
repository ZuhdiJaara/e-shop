//
//  User.swift
//  e shop
//
//  Created by Zuhdi Jaara on 25/09/2025.
//

import Foundation

struct User: Decodable{
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let password: String
    let image: String
}
