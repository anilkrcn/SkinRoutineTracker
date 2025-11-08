//
//  ChooseProductCategoryView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct ChooseProductCategoryView: View {
    @State private var selectedType: String? = nil
    
    let commonForms = ["Capsule", "Tablet", "Liquid", "Topical"]
    let moreForms = ["Cream", "Device", "Drops", "Foam"]
    
    var body: some View {
            VStack(spacing: 40) {
                
                ScrollView {
                    Image("cream") // geçici simge
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.background)
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.top, 40)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Choose the Medication Type")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // Common Forms Section
                        SectionView(title: "Common Forms", items: commonForms, selected: $selectedType)
                            .padding(.horizontal)
                        
                        // More Forms Section
                        SectionView(title: "More Forms", items: moreForms, selected: $selectedType)
                            .padding(.horizontal)
                        
                        // Next Button
                    }
                    .padding(.vertical)
                    
                }
                NavigationLink(destination: AddProductAmountView()){
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedType != nil ? Color.background : Color.primaryAccent)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 30)
                .disabled(selectedType == nil)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondaryAccent.ignoresSafeArea())
    }
}

struct SectionView: View {
    let title: String
    let items: [String]
    @Binding var selected: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.horizontal, 30)
            
            VStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Button(action: { selected = item }) {
                        HStack {
                            Text(item)
                                .foregroundColor(.white)
                            Spacer()
                            if selected == item {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.background)
                            }
                        }
                        .padding()
                        .background(Color.primaryAccent)
                        .cornerRadius(25)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ChooseProductCategoryView()
}
