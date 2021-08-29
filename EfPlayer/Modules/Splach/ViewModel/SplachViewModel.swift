//
//  SplachViewModel.swift
//  EfPlayer
//
//  Created by user on 27.08.2021.
//

import Foundation

class SplachViewModel: SplachViewModelProtocol {
    
    private var router: SplachRouterProtocol?
    private let configurationService: ConfigurationService
    
    init(
        router: SplachRouterProtocol,
        configurationService: ConfigurationService = DIContainer.default.configurationService
         ) {
        self.router = router
        self.configurationService = configurationService
    }
    
    func viewDidload() {
        let group = DispatchGroup()

        group.enter()
        self.configurationService
            .reload { (state) in
                if state == .loaded {
                    group.leave()
                }
            }
        group.notify(queue: .main) {  [weak self] in
            guard let self = self else {return}
              //      need to create a mein modul
            //        self.router.mainModule
            
            self.router?.routeToMain()
        }
    }
}
