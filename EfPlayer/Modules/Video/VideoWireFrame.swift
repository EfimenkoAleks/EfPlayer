//
//  VideoWireFrame.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import UIKit

class VideoWireFrame {
    
    static func create() -> UIViewController {
        
        let view = VideoViewController()
        let router = VideoRouter(controller: view)
        let viewModel = VideoViewModel(router: router)
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
}
