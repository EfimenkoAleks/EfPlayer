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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: HomeTableViewCell.self)
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.delegate = self
        self.view.backgroundColor = .systemBlue
    }

    

}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueCell(
                withType: HomeTableViewCell.self,
             for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        
        let model = self.viewModel.videos[indexPath.row]
        cell.configur(model: model)
        return cell
    }
    
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        return self.viewModel.titleHeader[section]
    }

    func tableView (tableView:UITableView , heightForHeaderInSection section:Int)->Float
    {

        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 20.0
    }
}

extension HomeViewController: UITableViewDelegate {}

extension HomeViewController: HomeDelegate {
    
    func fetchVideo() {
        self.tableView.reloadData()
    }
}
