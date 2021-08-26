//
//  VideoRouter.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import Foundation

class VideoRouter {
    
    private var controller: VideoViewControllerProtocol!
    
    init(controller: VideoViewControllerProtocol) {
        self.controller = controller
    }
}

extension VideoRouter: VideoRouterProtocol {}
