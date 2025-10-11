//
//  AddProductAmountView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct AddProductAmountView: View {
    @State private var amount: String = ""
    @State private var selectedUnit: String = "ml"
    
    let units = ["ml", "g", "%", "oz"]
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Başlık kısmı
            VStack(spacing: 8) {
                Image(systemName: "drop.circle.fill") // geçici simge
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                Text("Add Product Amount")
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding(.top, 60)
            
            // Miktar TextField
            VStack(alignment: .leading, spacing: 8) {
                Text("Amount")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, 32)
                
                TextField("e.g. 50", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6).opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
            }
            
            // Unit Picker
            VStack(alignment: .leading, spacing: 8) {
                Text("Choose Unit")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, 32)
                
                Picker("Unit", selection: $selectedUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit)
                            .tag(unit)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color(.systemGray6).opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal, 32)
            }
            
            Spacer()
            
            // Butonlar
            VStack(spacing: 12) {
                Button(action: {
                    print("Next tapped: \(amount) \(selectedUnit)")
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(amount.isEmpty ? Color.gray.opacity(0.3) : Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal, 32)
                }
                .disabled(amount.isEmpty)
                
                Button("Skip") {
                    print("Skipped amount input")
                }
                .foregroundColor(.gray)
            }
            .padding(.bottom, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    AddProductAmountView()
}
