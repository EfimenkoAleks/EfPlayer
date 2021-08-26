//
//  VideoCollectionViewCell.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configur(model: URL) {
        self.titleLabel.text = model.description
    }

}
