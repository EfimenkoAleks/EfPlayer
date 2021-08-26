//
//  AudioTableViewCell.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import UIKit

class AudioTableViewCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var nameSongLabel: UILabel!
    @IBOutlet private weak var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.iconImageView.image = UIImage(named: "noIcon")
    }

    func configure() {
        
    }
}
