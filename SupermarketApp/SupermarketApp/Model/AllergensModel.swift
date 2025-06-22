//
//  AllergensModel.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 21/06/2025.
//

import Foundation

struct AllergensModel: Codable {
    let id: UUID
    let gluten: Bool
    let lactose: Bool
    let peanut: Bool
    let boomnoot: Bool
    let celery: Bool
    let crustacean: Bool
    let egg: Bool
    let fish: Bool
    let lupine: Bool
    let milk: Bool
    let molluscs: Bool
    let sesame: Bool
    let soy: Bool
    let sulphites: Bool
    let wheat: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case gluten
        case lactose
        case peanut
        case boomnoot
        case celery
        case crustacean
        case egg
        case fish
        case lupine
        case milk
        case molluscs
        case sesame
        case soy
        case sulphites
        case wheat
    }
}
