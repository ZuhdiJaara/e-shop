//
//  SignInVC.swift
//  e shop
//
//  Created by Zuhdi Jaara on 25/09/2025.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        UserAPI.singInUser(username: usernameTextField.text!, password: passwordTextField.text!) { user, errorMessage in
            if let error = errorMessage {
                let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                 let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                 alert.addAction(action)
                 self.present(alert, animated: true, completion: nil)
            }else{
                if let loggedInUser = user{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MinaTabBarController")
                    UserManger.loggedInUser = loggedInUser
                    self.present(vc!, animated: true, completion: nil)
                }
            }
        }
    }
    
    
}
