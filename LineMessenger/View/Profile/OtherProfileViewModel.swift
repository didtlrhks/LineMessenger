//
//  OtherProfileViewModel.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation


import Foundation

@MainActor
class OtherProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    
    private let userId: String
    private let container: DIContainer
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId) {
            userInfo = user
        }
    }
}
