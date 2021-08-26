//
//  HomeWireFrame.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import UIKit

class HomeWireFrame {
    
    static func create() -> UIViewController {
        let view = HomeViewController()
        let router = HomeRouter(controller: view)
        let viewModel = HomeViewModel(router: router)
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
}
