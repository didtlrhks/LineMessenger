//
//  LoginView.swift
//  LineMessenger
//
//  Created by 양시관 on 3/11/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel : AuthenticationViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Group{
                
                
                Text("로그인")
                    .font(.system(size: 28,weight: .bold))
                    .foregroundColor(.bkText)
                    .padding(.top,80)
                Text("아래 제공되는 서비스로 로그인을 해주세요")
                    .font(.system(size: 14))
                    .foregroundColor(.greyDeep)
                
            }
            .padding(.horizontal,30)
            Spacer()
            
            Button{
                authViewModel.send(action: .googleLogin)
            }label: {
                Text("구글로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .bkText,borderColor: .greyLight))
            
            SignInWithAppleButton { request in
                authViewModel.send(action: .appleLogin(request))
            }onCompletion: { result in
                
            }
            
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button{
                    dismiss
                } label: {
                    Image("back")
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
