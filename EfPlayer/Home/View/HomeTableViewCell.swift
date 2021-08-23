//
//  HomeTableViewCell.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var textLab: UILabel!
    @IBOutlet weak var subTextLab: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
