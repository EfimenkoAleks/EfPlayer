//
//  HomeViewModel.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    private var router: HomeRouter?
    
    init(router: HomeRouter) {
        self.router = router
    }
}
