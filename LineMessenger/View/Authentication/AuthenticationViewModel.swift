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
        case checkAuthenticationState
        case googleLogin
        case appleLogin(ASAuthorizationAppleIDRequest)
        case appleLoginCompletion(Result<ASAuthorization, Error>)
        case logout
    }
     
    @Published var authenticationState : AuthenticationState = .unauthenticated
    @Published var isLoading = false
    
    var userId : String?
    private var currentNonce : String?
    private var container : DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
        
       
    }
    func send(action: Action) {
        switch action {
        case .checkAuthenticationState:
           if let userId =  container.services.authService.checkAuthenticationState() {
               self.userId = userId
               self.authenticationState = .authenticated
            }
        case .googleLogin:
            isLoading = true
            
            container.services.authService.signInWithGoogle()
                .flatMap {
                    user in
                    self.container.services.userService.addUser(user)
                }
           
                .sink{ [weak self] completion in
                    if case .failure = completion {
                        self?.isLoading = false
                    }
                } receiveValue: { [weak self] user in
                    self?.isLoading = false
                    self?.userId = user.id
                    self?.authenticationState = .authenticated
                    
                }.store(in: &subscriptions)
            
            
        case let .appleLogin(request) :
            let nonce = container.services.authService.handleSignInWithAppleRequest(request)
            currentNonce = nonce
            
        case let .appleLoginCompletion(result):
            if case let .success(authorization) = result {
                guard let nonce = currentNonce else {return }
                
                container.services.authService.handleSignInWithAppleCompletion(authorization, none: nonce)
                    .flatMap{
                        user in
                        self.container.services.userService.addUser(user)
                    }
                    .sink{
                        [weak self] completion in
                        if case .failure = completion {
                            self?.isLoading = false
                        }
                    } receiveValue: { [weak self] user in
                        self?.isLoading = false
                        self?.userId = user.id
                        self?.authenticationState = .authenticated
                        
                    }.store(in: &subscriptions)
            } else if case let .failure(error) = result {
                isLoading = false
                print(error.localizedDescription)
            }
        case .logout:
            container.services.authService.logout()
                .sink{
                    completion in
                } receiveValue: { [weak self] _ in
                    self?.authenticationState = .unauthenticated
                    self?.userId = nil
                    
                }.store(in: &subscriptions)
        }
    }
}
