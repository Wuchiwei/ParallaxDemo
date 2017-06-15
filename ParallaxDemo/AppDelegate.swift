//
//  AppDelegate.swift
//  ParallaxDemo
//
//  Created by WU CHIH WEI on 2017/6/15.
//  Copyright © 2017年 WU CHIH WEI. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = DemoTableViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

