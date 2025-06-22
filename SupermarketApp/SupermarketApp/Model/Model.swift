//
//  Model.swift
//  SupermarketApp
//
//  Created by Ivan Bondaruk on 22/06/2025.
//

import Foundation
import Supabase

class Model: ObservableObject {
    let supabase: SupabaseClient
    
    @Published var user: UserModel
    lazy var supabaseClient = SupabaseNewService(client: supabase)
    lazy var authClient = SupabaseAuthNewService(client: supabase)
    
    init() {
        self.user = UserModel(id: UUID(), firstName: "User", middleName: "", lastName: "", phone: "", points: 0, birthday: Date.now)
        
#if targetEnvironment(simulator)
        supabase = SupabaseClient(
            supabaseURL: URL(string: "http://127.0.0.1:54321")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
        )
#else
        supabase = SupabaseClient(
            supabaseURL: URL(string: "http://10.115.2.247:54321")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
        )
#endif
    }
}
