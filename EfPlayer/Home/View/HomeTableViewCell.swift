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
        
        self.setup()
    }

    private func setup() {
        self.menuButton.setImage(UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    func configur(model: URL) {
        self.textLab.text = model.description
    }
    
}
