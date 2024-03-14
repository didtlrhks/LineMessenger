//
//  ChatData.swift
//  LineMessenger
//
//  Created by 양시관 on 3/15/24.
//

import SwiftUI

import Foundation

struct ChatData: Hashable, Identifiable {
    var dateStr: String
    var chats: [Chat]
    var id: String { dateStr }
}
