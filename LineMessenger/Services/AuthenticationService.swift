//
//  AuthenticationService.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import Foundation
import Combine
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

enum AuthenticationError : Error {
    case clientIDError
    case tokenError
    case invalidated
}

protocol AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User,ServiceError>
}

class AuthenticationService : AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User,ServiceError>{
        Future { [weak self] promise in
            self?.signInWithGoogle { result in
                switch result {
                case let .success(user):
                    promise(.success(user))
                case let .failure(error):
                    promise(.failure(.error(error)))
                }
            }
            
        }.eraseToAnyPublisher()
    }
}

extension AuthenticationService{
    
    private func signInWithGoogle(completion : @escaping (Result<User,Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(AuthenticationError.clientIDError))
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self]
            result, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                completion(.failure(AuthenticationError.tokenError))
                return
            }
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            self?.authenticateUserWithFirebse(credential: credential, completion: completion)
        }
    }
    
    private func authenticateUserWithFirebse(credential: AuthCredential,completion:@escaping (Result<User,Error>) -> Void) {
        Auth.auth().signIn(with: credential) {
            result , error in
            if let error {
                completion(.failure(error))
                return
            }
            guard let result else {
                completion(.failure(AuthenticationError.invalidated))
                return
            }
            let firebaseUser = result.user
            let user: User = .init(id: firebaseUser.uid, name: firebaseUser.displayName ?? "",
                                   phoneNumber: firebaseUser.phoneNumber,
                                   profileURL: firebaseUser.photoURL?.absoluteString)
            completion(.success(user))
        }
    }
}



class StubAuthenticationService : AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User,ServiceError>{
        Empty().eraseToAnyPublisher()
    }
}
