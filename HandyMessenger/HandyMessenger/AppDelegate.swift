//
//  AppDelegate.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 3/14/18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let directMessagingVC = HandyMessageViewController()
        directMessagingVC.viewModel = DirectMessagingViewModel()
        directMessagingVC.tabBarItem = UITabBarItem(title: "Direct", image: UIImage(named: "user"), selectedImage: nil)
        
        let groupMessagingVC = HandyMessageViewController()
        groupMessagingVC.viewModel = GroupMessagingViewModel()
        groupMessagingVC.tabBarItem = UITabBarItem(title: "Group", image: UIImage(named: "group"), selectedImage: nil)
        
        let tabVC = UITabBarController()
        tabVC.viewControllers = [directMessagingVC, groupMessagingVC]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}

