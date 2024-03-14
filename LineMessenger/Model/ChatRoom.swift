//
//  ChatRoom.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation

struct ChatRoom: Hashable {
    var chatRoomId: String
    var lastMessage: String?
    var otherUserName: String
    var otherUseId: String
}
//
extension ChatRoom {
    func toObject() -> ChatRoomObject {
        .init(chatRoomId: chatRoomId,
              lastMessage: lastMessage,
              otherUserName: otherUserName,
              otherUseId: otherUseId)
    }
}

extension ChatRoom {
    static var stub1: ChatRoom {
        .init(chatRoomId: "chatRoom1_id", otherUserName: "양시관", otherUseId: "user1_id")
    }
    
    static var stub2: ChatRoom {
        .init(chatRoomId: "chatRoom2_id", otherUserName: "강민혜", otherUseId: "user2_id")
    }
}
