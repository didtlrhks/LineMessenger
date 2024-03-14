//
//  AuthenticatedView.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import SwiftUI

struct AuthenticatedView: View {
    @StateObject var authViewModel : AuthenticationViewModel
    @StateObject var navigationRouter : NavigationRouter
    var body: some View {
        VStack{
            switch authViewModel.authenticationState {
            case .unauthenticated:
                LoginIntroView()
                    .environmentObject(authViewModel)
            case .authenticated:
                MainTabView()
                    .environmentObject(authViewModel)
                    .environmentObject(navigationRouter)
            }
        }
        .onAppear{
            authViewModel.send(action: .checkAuthenticationState)
            //authViewModel.send(action: .logout)
        }
    }
}

#Preview {
    AuthenticatedView(authViewModel: .init(container: .init(services: StubService())), navigationRouter: .init())
}

