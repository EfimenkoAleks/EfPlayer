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
    fileprivate let videoService: VideoServiceProtocol
    
    init(
        router: VideoRouterProtocol,
         videoService: VideoServiceProtocol = DIContainer.default.videoService
         ) {
        self.router = router
        self.videoService = videoService
    }
}

extension VideoViewModel: VideoViewModelProtocol {
    
}
