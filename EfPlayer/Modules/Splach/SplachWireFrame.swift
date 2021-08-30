//
//  SplachWireFrame.swift
//  EfPlayer
//
//  Created by user on 27.08.2021.
//

import UIKit

class SplachWireFrame {
    static func create() -> UIViewController {
        let view = SplachViewController()
        let router = SplachRouter(controller: view)
        let viewModel = SplachViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
