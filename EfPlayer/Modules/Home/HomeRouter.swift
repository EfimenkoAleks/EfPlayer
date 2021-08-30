//
//  HomeRouter.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import UIKit

class HomeRouter {
    weak var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

extension HomeRouter: HomeRouterProtocol {
    
}
