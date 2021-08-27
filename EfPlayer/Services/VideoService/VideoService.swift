//
//  VideoService.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import Foundation
import Photos

protocol VideoServiceDelegate: AnyObject {
    func videoListDidChange()
}

protocol VideoServiceProtocol: Service {
    var delegate: VideoServiceDelegate? { get set }
}

class VideoService {
    internal var delegate: VideoServiceDelegate?
    private(set) var dataSource: [URL] = []
    internal var state: ServiceState = .initial
}

extension VideoService: VideoServiceProtocol {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.state = .loading

        self.fetchVideo { [weak self] (result) in
            if result.count > 0 {
                self?.dataSource = result
                self?.delegate?.videoListDidChange()
                self?.state = .loaded
                completionHandler(.loaded)
            }
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
