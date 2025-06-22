//
//  UserDetails.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 18/06/2025.
//

import SwiftUI
import PersonInitialsAvatar

struct UserDetails: View {
    @State private var user: UserModel?
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy" // или "yyyy-MM-dd", как нужно
        return formatter.string(from: date)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                VStack {
                    PersonInitialsAvatarView(fullName: user?.firstName ?? "User", diameter: 75, backgroundColor: .yellow)
                    
                    Text("\(user?.firstName ?? "User") \(user?.lastName ?? "")")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background {
                    RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                        .fill(Color(UIColor.secondarySystemBackground)
                        )
                        .padding(.horizontal)
                    
                }
                
                GroupBox(label: Text("Inloggegevens").font(.headline)) {
                    VStack(spacing: 1) {
                        settingsRow(title: "E-mailadres", content: AuthService.shared.session?.user.email ?? "None", view: AnyView(ProfileView()))
                        Divider()
                        settingsRow(title: "Wachtwoord", content: "*******", view: AnyView(ProfileView()))
                    }
                }
                .padding(.horizontal)
                
                GroupBox(label: Text("Contactgegevens").font(.headline)) {
                    VStack(spacing: 1) {
                        settingsRow(title: "Naam", content: "\(user?.firstName ?? "User") \(user?.lastName ?? "")", view: AnyView(UserNameChangeView()))
                        Divider()
                        settingsRow(title: "Telefoonnummer", content: user?.phone ?? "-", view: AnyView(UserPhoneChangeView()))
                        Divider()
                        settingsRow(title: "Adres", content: "Beatrixlaan 1B, 5531HA Bladel Nederland", view: AnyView(ProfileView()))
                    }
                }
                .padding(.horizontal)
                
                GroupBox(label: Text("Mijn winkel").font(.headline)) {
                    VStack(spacing: 1) {
                        settingsRow(title: "Jumbo Bladel Gindrapassage", content: "Gindrapassage 18 BLADEL", view: AnyView(ProfileView()))
                    }
                }
                .padding(.horizontal)
                
                GroupBox(label: Text("Mijn verjaardag").font(.headline)) {
                    VStack(spacing: 1) {
                        settingsRow(title: formatDate(user?.birthday ?? Date()) ?? "-", content: "", view: AnyView(ProfileView()))
                    }
                }
                .padding(.horizontal)
                
                GroupBox(label: Text("Allergenen").font(.headline)) {
                    VStack(spacing: 1) {
                        textRow(content: "Keis je allergenen, zodat de productinformatie voor jou persoonlijker wordt", view: AnyView(AllergensChangeView()))
                    }
                }
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.red)
                        
                        HStack{
                            Image(systemName: "trash")
                                .foregroundStyle(.white)
                            Text("Account verwijderen")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                    }
                }
                .padding()
                .frame(width: .infinity, height: 75)
            }
        }
        .navigationTitle("Mijn gegevens")
        .onAppear {
            Task {
                try await AuthService.shared.signIn(email: "bondarukid@icloud.com", password: "20030501VANJd")
                
                user = try await SupabaseService.shared.fetchUser().first
            }
        }
    }
    
    // Компонент строки настройки
    func settingsRow(title: String, content: String, view: AnyView) -> some View {
        NavigationLink {
            view
        } label: {
            HStack {
                Text(title)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text(content)
                    .multilineTextAlignment(.trailing)
                
                Image(systemName: "chevron.right")
            }
            .padding(.vertical, 15)
        }
        .foregroundStyle(.primary)
    }
    
    func textRow(content: String, view: AnyView) -> some View {
        NavigationLink {
            view
        } label: {
            HStack {
                Text(content)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(.vertical, 15)
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    UserDetails()
}
