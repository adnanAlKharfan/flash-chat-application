//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if emailTextfield.text?.trimmingCharacters(in:.whitespacesAndNewlines) != "" && passwordTextfield.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""{
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {  authResult, error in
        
            
            if error != nil {
                print(error?.localizedDescription)
            }
            else{
                self.performSegue(withIdentifier: "chat", sender: self)
            }
            
        }
            
        }
    }
    
}
