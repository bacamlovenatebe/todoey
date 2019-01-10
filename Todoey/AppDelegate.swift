//
//  AppDelegate.swift
//  Todoey
//
//  Created by Nebojsa Nadj on 1/10/19.
//  Copyright © 2019 Nebojsa Nadj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    fileprivate func UINavigationBarSetup() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 117/255, green: 188/255, blue: 239/255, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let TVC = TodoeyViewController()
        window?.rootViewController = UINavigationController(rootViewController: TVC)
        
        UINavigationBarSetup()
        
        
        return true
    }
    
}
