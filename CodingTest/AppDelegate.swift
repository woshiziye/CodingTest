//
//  AppDelegate.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        configureWindow()
        
        return true
    }


}

extension AppDelegate {
    func configureWindow() {
        let mainVC = MainVC()
        let rootNavi = UINavigationController(rootViewController: mainVC)
        window = UIWindow()
        window?.rootViewController = rootNavi
        window?.makeKeyAndVisible()
    }
}

