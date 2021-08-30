//
//  MainInterfaces.swift
//  EfPlayer
//
//  Created by user on 30.08.2021.
//

import UIKit

protocol MainViewModelInputProtocol: class {}

protocol MainViewModelOutputProtocol: class {
    func modules() -> [UIViewController]
}

protocol MainViewModelProtocol: MainViewModelInputProtocol, MainViewModelOutputProtocol {
    
}

protocol MainViewControllerProtocol: class {
    
}

protocol MainRouterProtocol: class {
    var homeModule: HomeWireFrame.HomeModule { get }
    var videoModule: VideoWireFrame.VideoModule { get }
    var audioModule: AudioWireFrame.AudioModule { get }
}
