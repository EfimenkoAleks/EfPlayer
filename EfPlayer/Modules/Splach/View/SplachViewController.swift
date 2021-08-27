//
//  SplachViewController.swift
//  EfPlayer
//
//  Created by user on 27.08.2021.
//

import UIKit

class SplachViewController: UIViewController {
    
    var viewModel: SplachViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.viewDidload()
    }

}
