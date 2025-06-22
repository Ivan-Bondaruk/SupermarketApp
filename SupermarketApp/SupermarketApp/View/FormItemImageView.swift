//
//  FormItemImageView.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 18/06/2025.
//

import SwiftUI

struct FormItemImageView: View {
    @State var iconName: String
    @State var content: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.primary) // обычный текст
            Spacer()
            Text(content)
                .foregroundColor(.primary) // тусклее, как в iOS
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    FormItemImageView(iconName: "arrow.trianglehead.clockwise.rotate.90", content: "Eerder gekocht")
}
