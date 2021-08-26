//
//  VideoViewModel.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import Foundation
import Photos

class VideoViewModel {
    
    weak var router: VideoRouterProtocol!
    
    init(router: VideoRouterProtocol) {
        self.router = router
    }
}

extension VideoViewModel: VideoViewModelProtocol {
    
}
