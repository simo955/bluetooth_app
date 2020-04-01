//
//  ViewController.swift
//  bluetooth_app_simo
//
//  Created by Simone  on 31/03/2020.
//  Copyright © 2020 Simone . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        
    }
    @IBAction func signUpTapped(_ sender: Any) {
    }
    @IBAction func loginTapped(_ sender: Any) {
    }
    
}

