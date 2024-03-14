//
//  ChatViewModel.swift
//  LineMessenger
//
//  Created by 양시관 on 3/15/24.
//

import SwiftUI
import Combine

class ChatViewModel : ObservableObject {
    
    enum Action {
        
    }
    @Published var chatDataList: [ChatData] = []
    @Published var myUser: User?
    @Published var otherUser: User?
    @Published var message: String = ""
    
    private let chatRoomId: String
    private let myUserId: String
    private let otherUserId: String
    
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, chatRoomId: String, myUserId: String, otherUserId: String) {
        self.container = container
        self.chatRoomId = chatRoomId
        self.myUserId = myUserId
        self.otherUserId = otherUserId
        
        
        updateChatDataList(.init(chatId: "chat1_id", userId: "user1_id",message: "heello", date: Date()))
        updateChatDataList(.init(chatId: "chat1_id", userId: "user2_id",message: "heello", date: Date()))
        updateChatDataList(.init(chatId: "chat1_id", userId: "user3_id",message: "heello", date: Date()))
        updateChatDataList(.init(chatId: "chat1_id", userId: "user4_id",message: "heello", date: Date()))
      
    }
    
    
    func updateChatDataList(_ chat: Chat) {
        let key = chat.date.toChatDataKey
//        
        if let index = chatDataList.firstIndex(where: { $0.dateStr == key }) {
            chatDataList[index].chats.append(chat)
        } else {
            let newChatData: ChatData = .init(dateStr: key, chats: [chat])
            chatDataList.append(newChatData)
        }
    }
    
    
    func getDirection(id: String) -> ChatItemDirection {
        myUserId == id ? .right : .left
    }
    
    
    func send(action:Action) {
        
    }
    
}
