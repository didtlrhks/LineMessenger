//
//  ChatRoomService.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation
import Combine


protocol ChatRoomServiceType {
    func createChatRoomIfNeeded(myUserId: String, otherUserId: String, otherUserName: String) -> AnyPublisher<ChatRoom, ServiceError>
    func loadChatRooms(myUserId: String) -> AnyPublisher<[ChatRoom], ServiceError>
}

class ChatRoomService : ChatRoomServiceType {
    private let dbRepository : ChatRoomDBRepositoryType
    
    init(dbRepository : ChatRoomDBRepositoryType) {
        self.dbRepository = dbRepository
    }
    
    
    func createChatRoomIfNeeded(myUserId: String, otherUserId: String, otherUserName: String) -> AnyPublisher<ChatRoom, ServiceError> {
        dbRepository.getChatRoom(myUserId: myUserId, otherUserId: otherUserId)
            .mapError { ServiceError.error($0) }
            .flatMap { object in
                if let object {
                    return Just(object.toModel()).setFailureType(to: ServiceError.self).eraseToAnyPublisher()
                } else {
                    let newChatRoom: ChatRoom = .init(chatRoomId: UUID().uuidString, otherUserName: otherUserName, otherUseId: otherUserId)
                    return self.addChatRoom(newChatRoom, to: myUserId)
                }
            }
            .eraseToAnyPublisher()
    }
    func addChatRoom(_ chatRoom: ChatRoom, to myUserId: String) -> AnyPublisher<ChatRoom, ServiceError> {
        dbRepository.addChatRoom(chatRoom.toObject(), myUserId: myUserId)
            .map { chatRoom }
            .mapError { .error($0) }
            .eraseToAnyPublisher()
    }
    func loadChatRooms(myUserId: String) -> AnyPublisher<[ChatRoom], ServiceError>{
        dbRepository.loadChatRooms(myUserId: myUserId)
            .map { $0.map { $0.toModel()} }
            .mapError { ServiceError.error($0) }
            .eraseToAnyPublisher()
    }
}

class StubChatRoomService : ChatRoomServiceType{
    func createChatRoomIfNeeded(myUserId: String, otherUserId: String, otherUserName: String) -> AnyPublisher<ChatRoom, ServiceError> {
       Just(.stub1).setFailureType(to: ServiceError.self).eraseToAnyPublisher()
       // Empty().eraseToAnyPublisher()

    }
    
    func loadChatRooms(myUserId: String) -> AnyPublisher<[ChatRoom], ServiceError>{
        Just([ .stub1 , .stub2]).setFailureType(to: ServiceError.self).eraseToAnyPublisher()
    }
}
