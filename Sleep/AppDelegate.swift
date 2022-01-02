//
//  AppDelegate.swift
//  Sleep
//
//  Created by Hithakshi on 01/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewcontroller = SleepViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewcontroller
        window?.makeKeyAndVisible()
        return true
    }


}

