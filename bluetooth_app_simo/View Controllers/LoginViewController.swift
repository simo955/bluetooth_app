//
//  LoginViewController.swift
//  bluetooth_app_simo
//
//  Created by Simone  on 31/03/2020.
//  Copyright © 2020 Simone . All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpElements()
                   // Do any additional setup after loading the view.
    }
               
               func setUpElements(){
                       
                Utilities.styleTextField(emailTextField)
                Utilities.styleTextField(passwordTextField)

                    Utilities.styleFilledButton(loginButton)
            }

        

    @IBAction func loginTapped(_ sender: Any) {
        
       // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       
       // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
           
            if error != nil {
               // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
           }
            else {
               
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
               
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
           }
       }
    }
    
}
