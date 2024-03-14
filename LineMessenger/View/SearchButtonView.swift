//
//  SearchButton.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
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

#Preview {
    SearchButton()
}
