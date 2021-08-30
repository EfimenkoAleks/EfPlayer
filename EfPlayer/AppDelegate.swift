//
//  AppDelegate.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let window = UIWindow()

        let module = SplachWireFrame.create()
        let navigation = UINavigationController(rootViewController: module)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

