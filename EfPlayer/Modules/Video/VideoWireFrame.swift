//
//  VideoWireFrame.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import UIKit

class VideoWireFrame {
    
    public struct VideoModule {
        let view: UIViewController
        let viewModel: VideoViewModelProtocol
        let router: VideoRouterProtocol
    }
    
    static func create() -> VideoModule {
        
        let view = VideoViewController()
        let router = VideoRouter(controller: view)
        let viewModel = VideoViewModel(router: router)
        view.viewModel = viewModel
        view.router = router
                
        return VideoModule(view: view, viewModel: viewModel, router: router)
    }
}
