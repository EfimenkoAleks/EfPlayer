//
//  VideoCollectionViewCell.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageVideo: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    let videoService = DIContainer.default.videoService
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageVideo.image = UIImage(named: "noIcon")
    }
    
    func configur(model: VideoModel) {
        
        self.titleLabel.text = model.title
        if let image = self.videoService.loadImageFromDiskWith(url: model.image) {
            self.imageVideo.image = UIImage(data: image)
        }
    }

}
