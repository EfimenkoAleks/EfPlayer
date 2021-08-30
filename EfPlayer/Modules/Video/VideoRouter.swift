//
//  VideoRouter.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import UIKit

class VideoRouter {
    
    weak var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

extension VideoRouter: VideoRouterProtocol {}
