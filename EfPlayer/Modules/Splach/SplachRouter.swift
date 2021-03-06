//
//  SplachRouter.swift
//  EfPlayer
//
//  Created by user on 27.08.2021.
//

import UIKit

class SplachRouter {
    private var controller: SplachViewController
    
    init(controller: SplachViewController) {
        self.controller = controller
    }
}

extension SplachRouter: SplachRouterProtocol {
    
    func routeToMain() {
        let controller = VideoWireFrame.create()
        self.controller.navigationController?.setViewControllers([controller], animated: true)
    }
}
