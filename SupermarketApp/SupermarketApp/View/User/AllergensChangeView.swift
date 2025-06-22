//
//  AllergensChangeView.swift
//  Jumbo
//
//  Created by Ivan Bondaruk on 21/06/2025.
//

import SwiftUI

struct AllergensChangeView: View {
    @State private var gluten: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                VStack{
                    Text("Kies jouw allergenen voor persoonlijkere productinformatie. Controleer zelf altijd de verpakking op ingredienten en allergenwijzigingen.")
                        .padding(.vertical)
                     // Image Priview
                     
                     GroupBox(label: Text("Meest voorkomende allergenen").font(.headline)) {
                         VStack(alignment: .leading,
                                spacing: 1) {
                             CustomCheckbox(isChecked: $gluten, label: "Gluten")
                             
                             CustomCheckbox(isChecked: $gluten, label: "Lactose")
                             
                             CustomCheckbox(isChecked: $gluten, label: "Pinda")
                             
                             CustomCheckbox(isChecked: $gluten, label: "Boomnoot")
                         }
                     }
                    
                    GroupBox(label: Text("Andere allergenen").font(.headline)) {
                        VStack(alignment: .leading,
                               spacing: 1) {
                            CustomCheckbox(isChecked: $gluten, label: "Selderij")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Schaaldier")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Ei")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Vis")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Lupine")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Melk")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Weekdieren")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Mosterd")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Sesam")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Soja")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Sulfieten")
                            
                            CustomCheckbox(isChecked: $gluten, label: "Tarwe")
                        }
                    }
                }
            }
            .padding(.horizontal)
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
    
    struct CustomCheckbox: View {
        @Binding var isChecked: Bool
        @State private var animate = false
        var label: String

        var body: some View {
            Button(action: {
                isChecked.toggle()
                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.2)) {
                    animate.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        animate.toggle()
                    }
                }
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .foregroundColor(isChecked ? .primary : .gray)
                        .frame(width: 18, height: 18)
                    
                    Text(label)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .frame(height: 48)
                .background {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .fill(Color(UIColor.tertiarySystemBackground).opacity(0.5))
                        
                        if isChecked {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.yellow)
                                .frame(width: 3.5)
                                .transition(.move(edge: .leading).combined(with: .opacity))
                        }
                        
                    }
                }
                .padding(.vertical, 10)
                .buttonStyle(PlainButtonStyle()) // Убирает эффект нажатия от кнопки
                .animation(.easeInOut(duration: 0.2), value: isChecked)
            }
        }
    }
}

#Preview {
    AllergensChangeView()
}
