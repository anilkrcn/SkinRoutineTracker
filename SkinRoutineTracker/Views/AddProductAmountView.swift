//
//  AddProductAmountView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct AddProductAmountView: View {
    @State private var amount: String = ""
    @State private var selectedUnit: String? = "ml"
    @FocusState private var isFocused: Bool
    
    let units = ["ml","mg","mcg", "g", "%", "oz"]
    
    var body: some View {
        
            VStack(spacing: 40) {
                ScrollView{
                    
                    Image("cosmetic") // geçici simge
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.background)
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.top, 80)
                    
                    // Üstte ikon veya küçük başlık
                    VStack(alignment: .leading,) {
                        Text("Amount")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(.leading, 30)
                        TextField("Add Product Amount", text: $amount)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                            .padding()
                            .background(Color.primaryAccent)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .toolbar{
                                ToolbarItemGroup(placement: .keyboard){
                                    Spacer()
                                    Button("Bitti"){
                                        isFocused = false
                                    }
                                }
                            }
                        
                        SectionView(title: "Choose Unit", items: units, selected: $selectedUnit)
                            .padding(.top, 40)
                        
                    }
                    .padding()
                    
                    // TextField
                    
                    Spacer()
                    
                    // Next Button
                }
                VStack(spacing: 0){
                    NavigationLink(destination: ChooseProductFormView()){
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(amount.isEmpty ? Color.primaryAccent : Color.background)
                            .cornerRadius(25)
                            .padding(.horizontal, 32)
                    }
                    .disabled(amount.isEmpty)
                    NavigationLink(destination: ChooseProductFormView()){
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.clear)
                            .cornerRadius(25)
                            .padding(.horizontal, 32)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondaryAccent.ignoresSafeArea())
        }
}

#Preview {
    AddProductAmountView()
}
