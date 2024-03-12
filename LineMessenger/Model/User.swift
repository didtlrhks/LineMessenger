//
//  User.swift
//  LineMessenger
//
//  Created by 양시관 on 3/11/24.
//

import Foundation

struct User{
    var id : String
    var name : String
    var phoneNumber : String?
    var profileURL : String?
    var description : String?
}

extension User {
    func toObject() -> UserObject {
        .init(id: id,
              name: name,
              phoneNumber: phoneNumber,
              profileURL: profileURL,
              description: description
            //  fcmToken: fcmToken
        )
    }
}

extension User {
    static var stub1 : User {
        .init(id:"user1_id", name:"양시관")
        
    }
    static var stub2 : User {
        .init(id:"user2_id" , name: "양시관1")
    }
}
