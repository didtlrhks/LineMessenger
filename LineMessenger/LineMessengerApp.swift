//
//  LineMessengerApp.swift
//  LineMessenger
//
//  Created by 양시관 on 3/10/24.
//

import SwiftUI

@main
struct LineMessengerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var container : DIContainer = .init(services: Services())
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init(container: container))
                .environmentObject(container)
        }
    }
}
