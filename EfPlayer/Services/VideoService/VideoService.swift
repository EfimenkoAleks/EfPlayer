//
//  VideoService.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import Foundation
import Photos

protocol VideoServiceProtocol: Service {
    var videoList: [VideoModel] { get }
    func loadImageFromDiskWith(url: URL) -> Data?
}

class VideoService {

    private(set) var videoList = [VideoModel]()
    internal var state: ServiceState = .initial
}

extension VideoService: VideoServiceProtocol {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.videoList = []
        self.state = .loading

        self.fetchVideo { [weak self] (result) in
            if result.count > 0 {
                self?.videoList = result
                self?.state = .loaded
                completionHandler(.loaded)
            }
        }
    }
    
    private func fetchVideo(completion: @escaping ([VideoModel]) -> Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType = %d ", PHAssetMediaType.video.rawValue)
        let allVideo = PHAsset.fetchAssets(with: .video, options: fetchOptions)

        var videoUrls: [VideoModel] = self.mockVideo()
        allVideo.enumerateObjects { [weak self] (asset, index, bool) in
            guard let self = self else { return }
            let imageManager = PHCachingImageManager()
            imageManager.requestAVAsset(forVideo: asset, options: nil) { (asset, audioMix, info) in
                if asset != nil {
                    let avasset = asset as! AVURLAsset
                    let urlVideo = avasset.url
                    print(urlVideo)
                    
                    let video = VideoModel(title: urlVideo.lastPathComponent, image: urlVideo, video: urlVideo)
                    
                    videoUrls.append(video)
                    self.saveVideoPreviewImage(url: urlVideo)
                }
            }
        }
        completion(videoUrls)
    }
    
    private func mockVideo() -> [VideoModel] {
        let str = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"

        guard let url = URL(string: str) else { return [] }
        let name = url.lastPathComponent
        
        self.saveVideoPreviewImage(url: url)
        let video = VideoModel(title: name, image: url, video: url)
        return [video, video, video, video, video]
    }
    
    private func saveVideoPreviewImage(url: URL) {
        
        let fileName = url.lastPathComponent
        if self.loadImageFromDiskWith(url: url) != nil {
            return
        }
        
        let asset = AVURLAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        if let cgImage = try? generator.copyCGImage(at: CMTime(seconds: 2, preferredTimescale: 60), actualTime: nil) {
        
            guard let data = cgImage.png else { return }
            
            let fileManager = FileManager.default
            let documentDir = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let localFile = documentDir.appendingPathComponent(fileName)
            
            do {
                try data.write(to: localFile)
                print("\(localFile)")
            } catch let error {
                print("error saving file with error", error)
            }
        }
        
    }
  
    func loadImageFromDiskWith(url: URL) -> Data? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let filename = url.lastPathComponent
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(filename)
            do {
                let image = try Data(contentsOf: imageUrl)
                return image
            } catch {
                return nil
            }
        }
        return nil
    }
}
