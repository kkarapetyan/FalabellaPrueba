//
//  User.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import Foundation

struct User {
    
    let name: String
    let email: String
    let password: String
    
    init(name: String, email: String, password: String) {
        
        self.name = name
        self.email = email
        self.password = password
    }
}
