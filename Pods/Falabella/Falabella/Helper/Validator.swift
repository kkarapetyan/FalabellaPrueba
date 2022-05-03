//
//  Validator.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import Foundation

class Validator: NSObject {
    
    //Is filled all fields
    func isFillFields(name: String?,
                      email: String?,
                      password: String?,
                      confirmPassword: String?) -> Bool {
        if name?.count ?? 0 > 0 &&
            email?.count ?? 0 > 0 &&
            password?.count ?? 0 > 0 &&
            confirmPassword?.count ?? 0 > 0{
            
            return true
        }
        return false
    }
    
    
    /// Is filled login felds
    func isLoginFilled(name: String?,
                      email: String?) -> Bool {
        
        return name?.count ?? 0 > 0 && email?.count ?? 0 > 0
    }
    
    
    ///Is confirm password same with password
    func isCorrectConfirmPassword(password: String?,
                                  confirmPassword: String?) -> Bool {
        return password == confirmPassword
    }
    
    ///Is valid  email address
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
