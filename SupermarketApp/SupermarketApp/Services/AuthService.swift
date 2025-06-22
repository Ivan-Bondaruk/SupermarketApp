//
//  AuthService.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 19/06/2025.
//

import Foundation
import Supabase

enum Secrets {
    static let supabaseURL: String = "http://10.115.2.245:54321"
    static let supabaseKey: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
}

final class AuthService {
    static let shared = AuthService()
    
    var session: Supabase.Session?
    
    private let auth = SupabaseService().client.auth
    
    init() {
        
    }
    
    func registerUserWithEmail(email: String, password: String) async throws {
        let response = try await auth.signUp(email: email, password: password)
        self.session = response.session
    }
    
    func signIn(email: String, password: String) async throws {
        let session = try await auth.signIn(email: email, password: password)
        self.session = session
    }
    
    func signOut() async throws {
        try await auth.signOut()
        self.session = nil
    }
}
