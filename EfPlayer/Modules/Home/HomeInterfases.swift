//
//  HomeInterfases.swift
//  EfPlayer
//
//  Created by user on 23.08.2021.
//

import Foundation

protocol HomeViewModelInputProtocol {
    
}

protocol HomeViewModelOutputProtocol {
    var delegate: HomeDelegate? { get set }
    var videos: [URL] { get }
    var titleHeader: [String] { get }
}

protocol HomeViewModelProtocol: HomeViewModelInputProtocol, HomeViewModelOutputProtocol { }

protocol HomeRouterProtocol {
    
}

protocol HomeDelegate: class {
    func fetchVideo()
}

