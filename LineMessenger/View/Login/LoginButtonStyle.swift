//
//  LoginButtonStyle.swift
//  LineMessenger
//
//  Created by 양시관 on 3/11/24.
//

import Foundation
import SwiftUI

struct LoginButtonStyle : ButtonStyle {
    
    let textColor: Color
    let borderColor : Color
    
    init(textColor: Color , borderColor: Color? = nil) {
        self.textColor = textColor
        self.borderColor = borderColor ?? textColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .foregroundColor(.lineappcolor)
            .frame(maxWidth: .infinity,maxHeight : 40)
            .overlay{
                RoundedRectangle(cornerRadius:5)
                    .stroke(Color.lineappcolor, lineWidth:0.8)
            }
            .padding(.horizontal, 15)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
