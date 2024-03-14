//
//  Services.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import Foundation

protocol ServiceType {
    var authService : AuthenticationServiceType {
        get set 
    }
    var userService : UserServiceType {get set}
 //   var contactService : ContactServiceType {get set}
}

class Services : ServiceType {
    var authService : AuthenticationServiceType
    var userService : UserServiceType
    
    init() {
        self.authService = AuthenticationService()
        self.userService = UserService(dbRepository: UserDBRepository())
    }
}

class StubService: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    var userService : UserServiceType = StubUserService()
}
