//
//  DIContainer.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import Foundation

class DIContainer : ObservableObject {
    var services : ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}

