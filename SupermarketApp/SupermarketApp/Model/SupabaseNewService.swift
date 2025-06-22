//
//  SupabaseNewService.swift
//  SupermarketApp
//
//  Created by Ivan Bondaruk on 22/06/2025.
//

import Foundation
import Supabase

final class SupabaseNewService {
    private let client: SupabaseClient
    
    init(client: SupabaseClient) {
        self.client = client
    }
    
    func postUserDetails(_ user: UserModel) async throws -> UserModel {
        try await client.from("users").insert(user).execute().value
    }
    
    func postUserAllergens(_ userAllergens: AllergensModel) async throws -> AllergensModel {
        try await client.from("allergens").insert(userAllergens).execute().value
    }
    
    func fetchUser() async throws -> [UserModel] {
        return try await client.from("users").select().eq("id", value: client.auth.user().id).execute().value
    }
}
