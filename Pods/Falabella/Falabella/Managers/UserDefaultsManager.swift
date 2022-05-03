//
//  UserDefaultsManager.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import Foundation


 class UserDefaultsManager {
     static let shared = UserDefaultsManager()
    
    /// Store in user defaults
    func store<T>(_ value: T, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    /// Fetch from user defaults
    func fetch<T: Hashable>(key: String, type: T.Type) -> T? {
        return UserDefaults.standard.value(forKey: key) as? T
    }
     
     ///Clean all user  default values
     func clean() {
         
         let domain = Bundle.main.bundleIdentifier!
         UserDefaults.standard.removePersistentDomain(forName: domain)
         UserDefaults.standard.synchronize()
     }
     
     ///Is logged in
     func isLoggedIn() -> Bool {
         
         if let _ = UserDefaults.standard.value(forKey: Constant.Keys.email),
            let _ = UserDefaults.standard.value(forKey: Constant.Keys.password) {
             return true
         }
         return false
     }
     

}



