//
//  NavigationDestination.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation


enum NavigationDestination : Hashable {
    case chat(chatRoomId: String, myUserId : String, otherUserId: String)
    case search(userId:String)
    
}
