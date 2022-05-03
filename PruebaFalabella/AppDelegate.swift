//
//  AppDelegate.swift
//  PruebaFalabella
//
//  Created by Karine Karapetyan on 03-05-22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var initialViewController: UIViewController?
    var navController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        initialViewController =  OpenModuleViewController(nibName: "OpenModuleViewController", bundle: nil)
        navController = UINavigationController(rootViewController: initialViewController!)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
                
        return true
    }
    
    // Lock the orientation to Landscape(Horizontal) mode
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask(rawValue: UIInterfaceOrientationMask.portrait.rawValue)
    }
}
