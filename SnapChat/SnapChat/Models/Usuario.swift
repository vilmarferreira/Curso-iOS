//
//  Usuario.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 27/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import Foundation

class Usuario{
    var email: String
    var name: String
    var uid: String
    
    init(email: String, name: String, uid: String) {
        
        self.email = email
        self.name = name
        self.uid = uid
    }
}
