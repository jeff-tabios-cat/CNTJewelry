//
//  User.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

// MARK: - User
struct User: Codable {
    let user: UserClass
}

// MARK: - UserClass
struct UserClass: Codable {
    let id, firstName, lastName: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
