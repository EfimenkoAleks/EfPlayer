//
//  MainViewController.swift
//  EfPlayer
//
//  Created by user on 30.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    
    private lazy var tabBar: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(self.viewModel.modules(), animated: false)
        tabBarController.tabBar.isHidden = false
        tabBarController.view.clipsToBounds = false
        if let view = tabBarController.view {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.view.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        }
        return tabBarController
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        self.tabBar.view.backgroundColor = .white
    }
    
    private func activateTab(index: Int, force: Bool = false) {
        
        guard !force else { return }
        self.tabBar.selectedIndex = index
    }


}

extension MainViewController: MainViewControllerProtocol {
    
}
