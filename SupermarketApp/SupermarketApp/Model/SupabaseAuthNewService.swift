//
//  SupabaseAuthNewService.swift
//  SupermarketApp
//
//  Created by Ivan Bondaruk on 22/06/2025.
//

import Foundation
import Supabase

class SupabaseAuthNewService {
    
    private let client: SupabaseClient
    var session: Supabase.Session?
    
    init(client: SupabaseClient) {
        self.client = client
    }
    
    func registerUserWithEmail(email: String, password: String) async throws {
        let response = try await client.auth.signUp(email: email, password: password)
        self.session = response.session
    }
    
    func signIn(email: String, password: String) async throws {
        let session = try await client.auth.signIn(email: email, password: password)
        self.session = session
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
        self.session = nil
    }
}
