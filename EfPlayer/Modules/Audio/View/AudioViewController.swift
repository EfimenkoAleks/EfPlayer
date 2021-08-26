//
//  AudioViewController.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import UIKit

class AudioViewController: UIViewController {
    
    var viewModel: AudioViewModelProtocol!
    var router: AudioRouterModuleProtocol!

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: AudioTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
}

extension AudioViewController: AudioViewControllerModuleProtocol {}

extension AudioViewController: UITableViewDelegate {}

extension AudioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueCell(
                withType: AudioTableViewCell.self,
             for: indexPath) as? AudioTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
