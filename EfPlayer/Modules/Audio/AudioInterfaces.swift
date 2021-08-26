//
//  AudioInterfaces.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import Foundation

protocol AudioViewModelInputProtocol: class {
    
}

protocol AudioViewModelOutputProtocol: class {}

protocol AudioViewModelProtocol: AudioViewModelInputProtocol, AudioViewModelOutputProtocol {
    
}

protocol AudioRouterModuleProtocol: class {
}

protocol AudioViewControllerModuleProtocol: class {
}
