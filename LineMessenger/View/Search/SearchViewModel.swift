//
//  SearchBar.swift
//  LMessenger
//
//
import Foundation

import Combine

class SearchViewModel : ObservableObject {
    
    
    enum Action {
        
    }
    
    private let userId: String
    private var container : DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init( container: DIContainer, userId: String) {
        self.userId = userId
        self.container = container
        //self.subscriptions = subscriptions
    }
    
    func send(action : Action) {
        
    }
}
