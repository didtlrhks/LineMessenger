//
//  UserObject.swift
//  LineMessenger
//
//  Created by 양시관 on 3/12/24.
//

import Foundation

struct UserObject: Codable {
    var id: String
    var name: String
    var phoneNumber: String?
    var profileURL: String?
    var description: String?
   // var fcmToken: String?
}
