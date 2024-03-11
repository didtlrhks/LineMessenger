//
//  AuthenticationViewModel.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import Foundation
import Combine
import AuthenticationServices


enum AuthenticationState {
    case unauthenticated
    case authenticated
    
}

class AuthenticationViewModel : ObservableObject {
    
    enum Action {
        case googleLogin
        case appleLogin(ASAuthorizationAppleIDRequest)
        case appleLoginCompletion(Result<ASAuthorization, Error>)
    }
    
    @Published var authenticationState : AuthenticationState = .unauthenticated
    
    var userId : String?
    private var currentNonce : String?
    private var container : DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
        
       
    }
    func send(action: Action) {
        switch action {
        case .googleLogin:
            container.services.authService.signInWithGoogle()
                .sink{ completion in
                    
                } receiveValue: { [weak self] user in
                    self?.userId = user.id
                    
                }.store(in: &subscriptions)
        case let .appleLogin(request) :
            let nonce = container.services.authService.handleSignInWithAppleRequest(request)
            currentNonce = nonce
            
        case let .appleLoginCompletion(result):
       
        }
    }
}
