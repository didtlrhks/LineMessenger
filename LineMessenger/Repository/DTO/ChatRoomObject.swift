//
//  ChatRoomObject.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation


struct ChatRoomObject: Codable {
    var chatRoomId: String
    var lastMessage: String?
    var otherUserName: String
    var otherUseId: String
}
//
extension ChatRoomObject {
    func toModel() -> ChatRoom {
        .init(chatRoomId: chatRoomId,
              lastMessage: lastMessage,
              otherUserName: otherUserName,
              otherUseId: otherUseId)
    }
}
//
extension ChatRoomObject {
    static var stub1: ChatRoomObject {
        .init(chatRoomId: "chatRoom1_id",
              otherUserName: "user2",
              otherUseId: "user2_id")
    }
}
