//
//  LineMessengerApp.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import SwiftUI

@main
struct LineMessengerApp: App {
    @StateObject var container : DIContainer = .init(services: Services())
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init())
                .environmentObject(container)
        }
    }
}
