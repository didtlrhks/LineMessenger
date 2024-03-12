//
//  DBError.swift
//  LineMessenger
//
//  Created by 양시관 on 3/12/24.
//

import Foundation

enum DBError : Error {
    case error(Error)
    case emptyValue
    case invalidatedType
}
