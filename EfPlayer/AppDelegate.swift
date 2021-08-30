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

extension AppDelegate {
    static var shared = AppDelegate()

    func setRootController(rootController: UIViewController) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIApplication.shared.windows.first
        window!.windowScene = windowScene
        window!.rootViewController?.dismiss(animated: true, completion: nil)
        window!.rootViewController = rootController
        window!.makeKeyAndVisible()
    }
}


