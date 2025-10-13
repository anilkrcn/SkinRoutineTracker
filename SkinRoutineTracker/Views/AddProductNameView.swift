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
        NavigationStack{
            VStack(spacing: 40) {
                
                Image(systemName: "drop.fill") // geçici simge
                    .font(.system(size: 50))
                    .foregroundColor(.background)
                    .padding(.top, 80)
                // Üstte ikon veya küçük başlık
                VStack(alignment: .leading) {
                    Text("Product Name")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    TextField("Add Product Name", text: $productName)
                        .padding()
                        .background(Color.primaryAccent)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                }
                .padding()
                
                // TextField
                
                Spacer()
                
                // Next Button
                
                    NavigationLink(destination: ChooseProductCategoryView()){
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(productName.isEmpty ? Color.primaryAccent : Color.background)
                        .cornerRadius(25)
                        .padding(.horizontal, 32)
                }
                .disabled(productName.isEmpty)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondaryAccent.ignoresSafeArea())
        }
    }
}

#Preview{
    AddProductNameView()
}
