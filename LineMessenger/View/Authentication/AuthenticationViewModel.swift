//
//  AuthenticationViewModel.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import Foundation


enum AuthenticationState {
    case unauthenticated
    case authenticated
    
}

class AuthenticationViewModel : ObservableObject {
    
    @Published var authenticationState : AuthenticationState = .unauthenticated
    
    private var container : DIContainer
    
    init(container: DIContainer) {
        self.container = container
        
       
    }
}
