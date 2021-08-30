//
//  MainWireFrame.swift
//  EfPlayer
//
//  Created by user on 30.08.2021.
//

import UIKit

class MainWireFrame {
    static func create() -> UIViewController {
        let view = MainViewController()
        let router = MainRouter(controller: view)
        let viewModel = MainViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
