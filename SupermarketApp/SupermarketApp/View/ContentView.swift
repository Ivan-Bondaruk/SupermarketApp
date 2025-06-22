//
//  ContentView.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 17/06/2025.
//

import SwiftUI
import Supabase

struct ContentView: View {
    var body: some View {
        TabView {
            StartView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .foregroundStyle(.yellow, .secondary)
                        
                        Text("Start")
                    }
                }
            
            ProductsView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.yellow, .secondary)
                        
                        Text("Producten")
                    }
                }
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .foregroundStyle(.yellow, .secondary)
                        
                        Text("Recepten")
                    }
                }
            
            StartView()
                .tabItem {
                    VStack {
                        Image(systemName: "house").foregroundStyle(.yellow, .secondary)
                        
                        Text("Aanbingen")
                    }
                }
            
            StartView()
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                            .foregroundStyle(.yellow, .secondary)
                        
                        Text("Mandje")
                    }
                }
        }
        .accentColor(.primary)
    }
}

#Preview {
    ContentView()
}
