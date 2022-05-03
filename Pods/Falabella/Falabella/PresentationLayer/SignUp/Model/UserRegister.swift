//
//  UserRegister.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 30-04-22.
//

import Foundation

struct UserRegister {
    
    let name: String?
    let email: String?
    let password: String?
    let confirmPassword: String?

    
    init(name: String?,
         email: String?,
         password: String?,
         confirmPassword: String?) {
                
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
