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
    var profileView : some View {
        HStack{
            VStack(alignment: .leading,spacing: 7) {
                Text("")
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider{
    static var previews: some View
    {
        HomeView(viewModel: .init())
    }
}
