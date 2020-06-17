//
//  RegisterViewController.swift
//  Flash-Chat
//
//  Created by Esraa Gamal on 5/14/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text , let password = passwordTextfield.text
        {
            //registering user with firestoreAuth
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }else{
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    
}
