//
//  SettingsTextBlockView.swift
//  OhmsLaw
//
//  Created by Ivan Bondaruk on 05/06/2025.
//

import SwiftUI

struct SettingsTextBlockView: View {
    @State var title: String
    @State var content: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary) // обычный текст
            Spacer()
            Text(content)
                .foregroundColor(.secondary) // тусклее, как в iOS
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    SettingsTextBlockView(title: "Author", content: "Ivan Bondaruk")
}
