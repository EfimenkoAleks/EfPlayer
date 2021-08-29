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
    private var videoData: [VideoModel]
    init(
        router: VideoRouterProtocol,
         videoService: VideoServiceProtocol = DIContainer.default.videoService
         ) {
        self.router = router
        self.videoService = videoService
        self.videoData = self.videoService.videoList
    }
}

extension VideoViewModel: VideoViewModelProtocol {
    
    var countVideo: Int {
        return self.videoData.count
    }
    
    func videos(index: Int) -> VideoModel {
        return self.videoData[index]
    }
}
