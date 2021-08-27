//
//  DIContainer.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import Foundation

struct DIContainer {
    
    static var `default` = Self()
    
    lazy var videoService: VideoServiceProtocol = VideoService()
}
