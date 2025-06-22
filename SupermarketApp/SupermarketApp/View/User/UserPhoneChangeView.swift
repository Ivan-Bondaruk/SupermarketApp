//
//  UserPhoneChangeView.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 18/06/2025.
//

import SwiftUI

struct CountryCode: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let code: String
}

struct UserPhoneChangeView: View {
    @State private var selectedCountry = CountryCode(name: "Netherlands", code: "+31")
    @State private var phoneNumber: String = "06164998443"
    @State private var selectedCode: String = ""
    
    let countries = [
        CountryCode(name: "Netherland", code: "+31"),
        CountryCode(name: "Belgium", code: "+31"),
        CountryCode(name: "Germany", code: "+49")
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                GroupBox(label: Text("Inloggegevens").font(.headline)) {
                    Menu {
                        ForEach(countries) { country in
                            Button(action: {
                                selectedCountry = country
                            }) {
                                HStack {
                                    Text(country.name)
                                    Spacer()
                                    Text(country.code)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedCountry.code)
                                .foregroundColor(.secondary)
                            Text(selectedCountry.name)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }
                    .frame(maxWidth: 200, alignment: .leading)
                    
                    VStack(spacing: 1) {
                        settingsRow(binding: $phoneNumber)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Telefoonnummer")
    }
    
    // Компонент строки настройки
    func settingsRow(binding: Binding<String>) -> some View {
        HStack {
            TextField("Optional", text: binding)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    UserPhoneChangeView()
}
