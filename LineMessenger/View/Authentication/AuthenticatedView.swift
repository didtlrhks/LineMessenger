//
//  AuthenticatedView.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import SwiftUI

struct AuthenticatedView: View {
    @StateObject var authViewModel : AuthenticationViewModel
    var body: some View {
        VStack{
            switch authViewModel.authenticationState {
            case .unauthenticated:
                LoginIntroView()
                    .environmentObject(authViewModel)
            case .authenticated:
                MainTabView()
            }
        }
        .onAppear{
            authViewModel.send(action: .checkAuthenticationState)
            //authViewModel.send(action: .logout)
        }
    }
}

#Preview {
    AuthenticatedView(authViewModel: .init(container: .init(services: StubService())))
}

