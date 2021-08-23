//
//  HomeViewController.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModelProtocol!
    var router: HomeRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }


}
