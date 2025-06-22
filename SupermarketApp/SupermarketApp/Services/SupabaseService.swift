//
//  SupabaseService.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 19/06/2025.
//

import Foundation
import Supabase

final class SupabaseService {
    
    static let shared = SupabaseService()
    
#if targetEnvironment(simulator)
    public let client = SupabaseClient(
      supabaseURL: URL(string: "http://127.0.0.1:54321")!,
      supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
    )
#else
    public let client = SupabaseClient(
      supabaseURL: URL(string: "http://10.115.2.247:54321")!,
      supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
    )
#endif
    
    init() {
        
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
