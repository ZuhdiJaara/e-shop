//
//  UserAPI.swift
//  e shop
//
//  Created by Zuhdi Jaara on 25/09/2025.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserAPI{
    static func singInUser(username: String, password: String, completionHandler: @escaping (User?, String?) -> Void){
        
        let url = "https://dummyjson.com/users"
        
        
        AF.request(url).responseJSON { response in
            
            let jsonData = JSON(response.value)
            let data = jsonData["users"]
            let decoder = JSONDecoder()
            
            do{
                let users = try decoder.decode([User].self, from: data.rawData())
                
                var foundUser: User?
                for user in users{
                    if user.username == username && user.password == password{
                        foundUser = user
                        break
                    }
                }
                if let user = foundUser{
                    completionHandler(foundUser,nil)
                }else{
                    completionHandler(nil,"The first name or last name is incorrect")
                }
                
            }catch let error{
                print(error)
            }
        }
    }
}
