//
//  ConfigurationService.swift
//  EfPlayer
//
//  Created by user on 27.08.2021.
//

import Foundation

protocol ConfigurationService: Service {}

class ConfigurationServiceImplementation {
    
    private(set) var state: ServiceState = .initial
    fileprivate let videoService: VideoServiceProtocol
    
    init(
        videoService: VideoServiceProtocol
    ) {
        self.videoService = videoService
    }
    
    fileprivate func loadServices(completionHandler: @escaping () -> Void) {
        
        self.state = .loading
        
        let services = [self.videoService]
 
        let group = DispatchGroup()
        
        services
            .forEach({
                group.enter()
                $0.reload { (state) in
                    if state == .loaded {
                        group.leave()
                    }
                }
            })
        
        group.notify(queue: .main) {
            self.state = .loaded
            completionHandler()
        }
    }
}

extension ConfigurationServiceImplementation: ConfigurationService {

    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.loadServices { [unowned self] in
            completionHandler(self.state)
        }
    }
}
