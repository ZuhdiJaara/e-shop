//
//  MenuListController.swift
//  e shop
//
//  Created by Zuhdi Jaara on 18/09/2025.
//

import UIKit

class MenuListController: UITableViewController {
    
    var items = ["My Account","Settings","About","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorColor = .clear
        tableView.backgroundColor = .systemGray3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = .systemGray3
        if items[indexPath.row] == "Logout" {
            cell.textLabel?.textColor = .red
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if items[indexPath.row] == "Logout" {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
            present(vc, animated: true, completion: nil)
            UserManger.loggedInUser = nil
        }

    }
}
