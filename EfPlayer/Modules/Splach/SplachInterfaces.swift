//
//  SplachInterfaces.swift
//  EfPlayer
//
//  Created by user on 27.08.2021.
//

import Foundation

protocol SplachViewModelInputProtocol: class {
    func viewDidload()
}

protocol SplachViewModelOutputProtocol: class {}

protocol SplachViewModelProtocol: SplachViewModelInputProtocol, SplachViewModelOutputProtocol {}

protocol SplachRouterProtocol: class {
    func routeToMain()
}

protocol SplachViewControllerProtocol: class {}

protocol VideoDelegate: class {
    func fetchVideo()
}
