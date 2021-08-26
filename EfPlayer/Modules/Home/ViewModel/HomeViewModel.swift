//
//  HomeViewModel.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import Foundation
import Photos

class HomeViewModel: HomeViewModelProtocol {
  
    private var router: HomeRouter?
    private var videoUrlArrey: [URL] = []
    var videos: [URL] = []
    private var titleForHeader: [String] = []
    var titleHeader: [String] = []
    var delegate: HomeDelegate?
    
    init(router: HomeRouter) {
        self.router = router
        self.titleForHeader = ["Google Drive", "Video", "Music"]
        self.titleHeader = self.titleForHeader
        self.fetchVideo { [weak self] (result) in
            self?.delegate?.fetchVideo()
            self?.videoUrlArrey = result
            self?.videos = result
        }
    }
    
    private func fetchVideo(completion: @escaping ([URL]) -> Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType = %d ", PHAssetMediaType.video.rawValue)
        let allVideo = PHAsset.fetchAssets(with: .video, options: fetchOptions)

        var videoUrls: [URL] = []
        allVideo.enumerateObjects { (asset, index, bool) in
            let imageManager = PHCachingImageManager()
            imageManager.requestAVAsset(forVideo: asset, options: nil) { (asset, audioMix, info) in
                if asset != nil {
                    let avasset = asset as! AVURLAsset
                    let urlVideo = avasset.url
                    print(urlVideo)
                    videoUrls.append(urlVideo)
                }
            }
        }
        completion(videoUrls)
    }
    
    
}
