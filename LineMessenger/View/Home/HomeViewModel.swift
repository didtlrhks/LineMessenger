//
//  HomeViewModel.swift
//  LineMessenger
//
//  Created by 양시관 on 3/12/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var myUser:User?
    @Published var users: [User] = [.stub1,.stub2]
}
