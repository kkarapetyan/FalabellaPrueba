//
//  UINavigationController+Color.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import UIKit

extension UINavigationController {

    
      func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
          popToViewController(vc, animated: animated)
        }
      }
    
    
    func setNavigationBarBackground(color: UIColor) {
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = color
            
            appearance.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationBar.standardAppearance = appearance
            self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
        } else {
            self.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
}
