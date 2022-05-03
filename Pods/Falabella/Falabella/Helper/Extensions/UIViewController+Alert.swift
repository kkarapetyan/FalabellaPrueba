//
//  UIViewController+Alert.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import UIKit

extension UIViewController {
    
    func showAlertMessage(_ title: String = "", meassage: String, action: @escaping (() -> ())) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: meassage, preferredStyle: .alert)
           // alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            // delays execution of code to dismiss
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                alert.dismiss(animated: true, completion: nil)
                action()
            })
        }
    }
    
    func showAlertMessage(_ title: String = "", meassage: String, actionText: String, action: @escaping (() -> ())) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: meassage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: actionText, style: .default, handler: {_ in
                action()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
