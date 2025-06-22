//
//  ProfileView.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 18/06/2025.
//

import SwiftUI
import PersonInitialsAvatar

struct ProfileView: View {
    @State private var user: UserModel?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 32) {
                    VStack {
                        PersonInitialsAvatarView(fullName: user?.firstName ?? "User", diameter: 75, backgroundColor: .yellow)
                        
                        Text("Hallo \(user?.firstName ?? "User")")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack{
                            Text("Je hebt ")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text(String(user?.points ?? 0))
                                .font(.headline)
                                .fontWeight(.bold)
                                .overlay(
                                    Rectangle()
                                        .fill(Color.yellow)
                                        .frame(height: 4)
                                        .offset(y: 10), // отступ вниз от текста
                                    alignment: .bottom
                                )
                            
                            Text("punten")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 32)
                    
                    GroupBox(label: Text("Boodschapen").font(.headline)) {
                        VStack(spacing: 1) {
                            settingsRow(icon: "arrow.trianglehead.clockwise.rotate.90", title: "Eerder gekocht", view: AnyView(ProductsView()))
                            Divider()
                            settingsRow(icon: "cart", title: "Bestellingen", view: AnyView(ProductsView()))
                            Divider()
                            settingsRow(icon: "heart", title: "Lijstjes", view: AnyView(ProductsView()))
                            Divider()
                            settingsRow(icon: "truck.box", title: "Bezorgeloos", view: AnyView(ProductsView()))
                        }
                    }
                    .padding(.horizontal)
                    
                    GroupBox(label: Text("Gegevens en voorkeuren").font(.headline)) {
                        VStack(spacing: 1) {
                            settingsRow(icon: "person", title: "Mijn gegevens", view: AnyView(UserDetails()))
                            Divider()
                            settingsRow(icon: "envelope", title: "E-mails en meldingen", view: AnyView(ProductsView()))
                            Divider()
                            settingsRow(icon: "info.circle", title: "Privacy en cookies", view: AnyView(ProductsView()))
                            Divider()
                            settingsRow(icon: "hand.thumbsup", title: "Jumbo online test panel", view: AnyView(ProductsView()))
                        }
                    }
                    .padding(.horizontal)
                    
                    GroupBox(label: Text("Hulp en contact").font(.headline)) {
                        VStack(spacing: 1) {
                            settingsRow(icon: "envelope.front", title: "Klantenservice", view: AnyView(ProductsView()))
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {

                        Text("App versie: 15.3.0 (1748937610)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Bundel: 15.4.0")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Laaste updateL 2025-06-17 19:11:35")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Button {
                        Task {
                            
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.red)
                            
                            Text("Uitloggen")
                                .foregroundColor(.white)
                                .bold()
                            
                        }
                    }
                    .padding()
                    .frame(width: .infinity, height: 75)
                }
            }
        }
        .onAppear {
            Task {
                try await AuthService.shared.signIn(email: "bondarukid@icloud.com", password: "20030501VANJd")
                print(AuthService.shared.session?.user.email)
                user = try await SupabaseService.shared.fetchUser().first
            }
        }
    }
    
    // Компонент строки настройки
    func settingsRow(icon: String, title: String, view: AnyView) -> some View {
        NavigationLink {
            view
        } label: {
            HStack {
                Image(systemName: icon)

                Text(title)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(.vertical, 15)
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    ProfileView()
}
