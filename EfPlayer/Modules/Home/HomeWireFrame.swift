//
//  HomeWireFrame.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import UIKit

class HomeWireFrame {
    
    public struct HomeModule {
        let view: UIViewController
        let viewModel: HomeViewModelProtocol
        let router: HomeRouterProtocol
    }
    
    static func create() -> HomeModule {
        let view = HomeViewController()
        let router = HomeRouter(controller: view)
        let viewModel = HomeViewModel(router: router)
        view.viewModel = viewModel
        view.router = router
        
        return HomeModule(view: view, viewModel: viewModel, router: router)
    }
}
