//
//  Service.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import Foundation

enum ServiceState {
    case initial
    case loading
    case loaded
    case error
}

protocol Service: AnyObject {
    var state: ServiceState { get }
    func reload(completionHandler: @escaping (ServiceState) -> Void)
}
