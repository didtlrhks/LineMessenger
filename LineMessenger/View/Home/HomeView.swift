//
//  HomeView.swift
//  LineMessenger
//
//  Created by 양시관 on 3/12/24.
//

import Foundation
import SwiftUI

struct HomeView : View {
    @StateObject var viewModel : HomeViewModel
    
    var body : some View
    {
        NavigationStack {
            ScrollView {
                profileView
                    .padding(.bottom,30)
                
                searchButton
            }.toolbar {
                Image("bookmark")
                Image("notifications")
                Image("person_add")
                Button {
                    
                } label : {
                    Image("settings")
                }
            }
        }
    }
    
    var profileView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(viewModel.myUser?.name ?? "이름")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.bkText)
                Text(viewModel.myUser?.description ?? "상태 메시지 입력")
                    .font(.system(size: 12))
                    .foregroundColor(.greyDeep)
            }
            Spacer()
            
            Image("person")
                .frame(width:52,height: 52)
                .clipShape(Circle())
        }
        .padding(.horizontal,30)
    }
    var searchButton : some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 36)
                .background(Color.greyCool)
                .cornerRadius(5)
            
            HStack {
                Text("검색")
                    .font(.system(size: 12))
                    .foregroundColor(.greyLightVer2)
                Spacer()
            }
            .padding(.leading,22)
        }
        .padding(.horizontal,30)
    }
    
    
}


struct HomeView_Previews: PreviewProvider{
    static var previews: some View
    {
        HomeView(viewModel: .init())
    }
}
