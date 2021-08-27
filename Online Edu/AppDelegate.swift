//
//  AppDelegate.swift
//  Online Edu
//
//  Created by Likhit Garimella on 19/08/21.
//  Copyright © 2021 Likhit Garimella. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        /// Status bar color
        /// In Info.plist, View controller-based status bar appearance -> NO
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 87/255, green: 154/255, blue: 243/255, alpha: 1.0)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        UITabBar.appearance().barTintColor = UIColor(red: 87/255, green: 154/255, blue: 243/255, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        UITabBar.appearance().tintColor = .white
        
        /// Increase Launch Screen Time
        Thread.sleep(forTimeInterval: 1)
        
        return true
        
    }

    // MARK:- UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}   // #56
