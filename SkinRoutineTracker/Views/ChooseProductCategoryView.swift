//
//  ChooseProductCategoryView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct ChooseProductCategoryView: View {
    @State private var selectedCategory: String? = nil
    
    // Örnek kategori verileri
    let commonCategories = ["Cleanser", "Toner", "Serum", "Moisturizer", "Sunscreen"]
    let moreCategories = ["Mask", "Exfoliator", "Oil", "Spot Treatment", "Eye Cream"]
    
    var body: some View {
        VStack(spacing: 30) {
            ScrollView{
                // Başlık
                VStack(spacing: 8) {
                    Image(systemName: "sparkles") // geçici simge
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                    Text("Choose Product Category")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                }
                .padding(.top, 60)
                
                // Common Categories
                VStack(alignment: .leading, spacing: 10) {
                    Text("Common Categories")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.horizontal, 20)
                    
                    ForEach(commonCategories, id: \.self) { category in
                        CategoryRow(title: category, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                
                // More Categories
                VStack(alignment: .leading, spacing: 10) {
                    Text("More Categories")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.horizontal, 20)
                    
                    ForEach(moreCategories, id: \.self) { category in
                        CategoryRow(title: category, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                
                Spacer()
                
                // Next Button
                Button(action: {
                    print("Next tapped with: \(selectedCategory ?? "")")
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedCategory == nil ? Color.gray.opacity(0.3) : Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal, 32)
                }
                .disabled(selectedCategory == nil)
                .padding(.bottom, 40)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

// MARK: - Category Row Component
struct CategoryRow: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .padding()
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
                    .padding(.trailing, 12)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6).opacity(0.15))
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .animation(.easeInOut, value: isSelected)
    }
}

#Preview {
    ChooseProductCategoryView()
}
