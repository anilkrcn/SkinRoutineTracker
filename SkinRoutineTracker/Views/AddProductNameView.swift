//
//  AddProductNameView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct AddProductNameView: View {
    @State private var productName: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            // Üstte ikon veya küçük başlık
            VStack(spacing: 8) {
                Image(systemName: "drop.fill") // geçici simge
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                Text("Product Name")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
            
            // TextField
            TextField("Add product name", text: $productName)
                .padding()
                .background(Color(.systemGray6).opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal, 32)
            
            Spacer()
            
            // Next Button
            Button(action: {
                print("Next tapped with: \(productName)")
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(productName.isEmpty ? Color.gray.opacity(0.3) : Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal, 32)
            }
            .disabled(productName.isEmpty)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    AddProductNameView()
}
