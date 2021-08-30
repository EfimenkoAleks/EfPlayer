//
//  AudioRouter.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import UIKit

class AudioRouter {
    
     weak var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

extension AudioRouter: AudioRouterProtocol {}
