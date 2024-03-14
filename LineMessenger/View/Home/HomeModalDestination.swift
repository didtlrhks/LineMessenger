//
//  HomeModalDestination.swift
//  LineMessenger
//
//  Created by 양시관 on 3/12/24.
//

import Foundation

import Foundation

enum HomeModalDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
   // case setting
    
    var id: Int {
        hashValue
    }
}
