//
//  NavigationRoutingView.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @State var destination: NavigationDestination
    var body: some View {
        switch destination {
        case .chat:
            ChatView()
        case .search:
            SearchView()
        }
    }
}
