//
//  User.swift
//  bluetooth_app_simo
//
//  Created by Simone  on 07/04/2020.
//  Copyright © 2020 Simone . All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var email: String?
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
}
