//
//  Falabella.swift
//  Falabella
//
//  Created by Karine Karapetyan on 01-05-22.
//

import Foundation
import UIKit

public final class Falabella {

   public init() {
        
    }
    
   public func getCurrentViewController() -> UIViewController? {
       print ("Modul is working")
              
       if UserDefaultsManager.shared.isLoggedIn() {
           let frameworkBundle = Bundle(for: AttributesViewController.self)
           let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Falabella.bundle")
          return AttributesViewController(nibName: Constant.NibNames.attributes, bundle: Bundle(url: bundleURL!))
          
       } else {
           let frameworkBundle = Bundle(for: LoginViewController.self)
           let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Falabella.bundle")
          return  LoginViewController(nibName: Constant.NibNames.login, bundle: Bundle(url: bundleURL!))
          
       }

    }
    
}


