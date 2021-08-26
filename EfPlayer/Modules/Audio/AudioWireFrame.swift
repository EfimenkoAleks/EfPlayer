//
//  AudioWireFrame.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import UIKit

class AudioWireFrame {
    
    static func create() -> UIViewController {
        let view = AudioViewController()
        let router = AudioRouter(controller: view)
        let viewModel = AudioViewModel(router: router)
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
}
