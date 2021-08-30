//
//  AudioWireFrame.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import UIKit

class AudioWireFrame {
    
    public struct AudioModule {
        let view: UIViewController
        let viewModel: AudioViewModelProtocol
        let router: AudioRouterProtocol
    }
    
    static func create() -> AudioModule {
        let view = AudioViewController()
        let router = AudioRouter(controller: view)
        let viewModel = AudioViewModel(router: router)
        view.viewModel = viewModel
        view.router = router
        
        return AudioModule(view: view, viewModel: viewModel, router: router)
    }
}
