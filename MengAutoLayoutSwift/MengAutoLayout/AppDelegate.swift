//
//  AppDelegate.swift
//  MengViewController
//
//  Created by menglingchao on 2020/4/1.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let vc = ViewController()
        let nc = UINavigationController(rootViewController: vc)
        window?.rootViewController = nc
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

