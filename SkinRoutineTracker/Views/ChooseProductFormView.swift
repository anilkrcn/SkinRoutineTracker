//
//  ChooseProductFormView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct ChooseProductFormView: View {
    @State private var selectedForm: String? = nil
    
    let productForms = [
        ("drop.fill", "Serum"),
        ("rectangle.roundedbottom.fill", "Cream"),
        ("leaf.fill", "Gel"),
        ("sparkles", "Foam"),
        ("wind", "Spray"),
        ("drop.circle", "Oil"),
        ("face.smiling", "Sheet Mask")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Başlık
            VStack(spacing: 8) {
                Image(systemName: "paintbrush.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                Text("Choose Product Form")
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding(.top, 60)
            
            // Grid düzeninde form ikonları
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 24) {
                ForEach(productForms, id: \.1) { icon, name in
                    VStack(spacing: 10) {
                        Image(systemName: icon)
                            .font(.system(size: 30))
                            .foregroundColor(selectedForm == name ? .white : .gray)
                            .frame(width: 60, height: 60)
                            .background(selectedForm == name ? Color.blue : Color(.systemGray6).opacity(0.2))
                            .cornerRadius(14)
                        Text(name)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedForm = name
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Next Button
            Button(action: {
                print("Selected form: \(selectedForm ?? "")")
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedForm == nil ? Color.gray.opacity(0.3) : Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal, 32)
            }
            .disabled(selectedForm == nil)
            .padding(.bottom, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    ChooseProductFormView()
}
