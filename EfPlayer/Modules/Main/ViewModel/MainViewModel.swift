//
//  MainViewModel.swift
//  EfPlayer
//
//  Created by user on 30.08.2021.
//

import Foundation
import UIKit

class MainViewModel {
    
    private var router: MainRouterProtocol
    private var titles: [String]
    private var images: [String]
    
    init(router: MainRouterProtocol) {
        self.router = router
        self.titles = ["Home", "Video", "Audio"]
        self.images = ["home", "video", "music"]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
        navController.tabBarItem.badgeColor = .red
            return navController
        }
}

extension MainViewModel: MainViewModelProtocol {
    
    func modules() -> [UIViewController] {
        guard let image1 = UIImage(named: self.images[0]),
              let image2 = UIImage(named: self.images[1]),
              let image3 = UIImage(named: self.images[2])
        else { return []}
        
        return [
            self.createNavController(for: self.router.homeModule.view, title: self.titles[0], image: image1),
            self.createNavController(for: self.router.videoModule.view, title: self.titles[1], image: image2),
            self.createNavController(for: self.router.audioModule.view, title: self.titles[2], image: image3)
        ]
    }
}
