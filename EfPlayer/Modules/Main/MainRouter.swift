//
//  MainRouter.swift
//  EfPlayer
//
//  Created by user on 30.08.2021.
//

import UIKit

class MainRouter: MainRouterProtocol {
    weak var controller: UIViewController?
    
    private(set) var homeModule: HomeWireFrame.HomeModule
    private(set) var videoModule: VideoWireFrame.VideoModule
    private(set) var audioModule: AudioWireFrame.AudioModule
    
    init(controller: UIViewController) {
        self.controller = controller
        self.homeModule = HomeWireFrame.create()
        self.videoModule = VideoWireFrame.create()
        self.audioModule = AudioWireFrame.create()
    }
}
