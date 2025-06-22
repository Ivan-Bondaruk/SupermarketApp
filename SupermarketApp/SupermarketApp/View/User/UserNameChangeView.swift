//
//  UserNameChangeView.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 18/06/2025.
//

import SwiftUI

struct UserNameChangeView: View {
    @State private var name: String = ""
    @State private var middle: String = ""
    @State private var last: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                GroupBox(label: Text("Inloggegevens").font(.headline)) {
                    VStack(spacing: 1) {
                        settingsRow(title: "Voornaam", binding: $name)
                        Divider()
                        settingsRow(title: "Tussenvoegsel", binding: $middle)
                        Divider()
                        settingsRow(title: "Achternaam", binding: $last)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Naam")
    }
    
    // Компонент строки настройки
    func settingsRow(title: String, binding: Binding<String>) -> some View {
        HStack {
            Text(title)
                .multilineTextAlignment(.leading)
                .frame(width: 150, alignment: .leading)
            
            TextField("Optional", text: binding)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    UserNameChangeView()
}
