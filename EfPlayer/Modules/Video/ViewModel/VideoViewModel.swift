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
    weak var delegate: VideoDelegate?
    
    init(
        router: VideoRouterProtocol,
         videoService: VideoServiceProtocol = DIContainer.default.videoService
         ) {
        self.router = router
        self.videoService = videoService
        self.videoService.delegate = self
    }
}

extension VideoViewModel: VideoViewModelProtocol {
    
}

extension VideoViewModel: VideoServiceDelegate {
    func videoListDidChange() {
        self.delegate?.fetchVideo()
    }
}
