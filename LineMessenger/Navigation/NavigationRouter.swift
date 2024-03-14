//
//  NavigationRouter.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation

class NavigationRouter : ObservableObject {
    @Published var destination : [NavigationDestination] = []
    
    func push(to view:NavigationDestination) {
        destination.append(view)
    }
    func pop() {
        _ = destination.popLast()
    }
    func popToRootView () {
        destination = []
    }
}
