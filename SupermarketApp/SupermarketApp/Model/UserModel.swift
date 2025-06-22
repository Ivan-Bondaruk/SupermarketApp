//
//  UserModel.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 18/06/2025.
//

import Foundation

struct UserModel: Codable {
    let id: UUID
    let firstName: String
    let middleName: String
    let lastName: String
    let phone: String
    let points: Int
    let birthday: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case phone
        case points
        case birthday
    }
}
