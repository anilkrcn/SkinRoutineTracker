//
//  FrequencyView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 22.11.2025.
//

import SwiftUI

struct FrequencyView: View {
    @Environment(\.dismiss) private var dismiss
    let frequencyOptions: [FrequencyOption] = [
        FrequencyOption(title: "Her gün", subtitle: "Her gün aynı zamanda kullan"),
        FrequencyOption(title: "Bir döngü halinde kullan", subtitle: "21 gün kullan, 7 gün ara ver"),
        FrequencyOption(title: "Haftanın belirli günleri", subtitle: "Pazartesi, Çarşamba"),
        FrequencyOption(title: "Birkaç günde bir", subtitle: "Her 3 günde bir")
    ]

    var body: some View {
            VStack(alignment: .leading){
                List {
                    Section(header: Text("Kullanım Sıklığı").font(.headline)) {
                        ForEach(frequencyOptions) { option in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(option.title)
                                    .font(.body)
                                    .fontWeight(.medium)
                                
                                Text(option.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 4)
                            .listRowBackground(Color.primaryAccent)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.secondaryAccent)
                .listStyle(.insetGrouped)
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.secondaryAccent.ignoresSafeArea())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Kapat") {
                            dismiss()
                        }.tint(Color.background)
                    }
                }
    }
}


#Preview {
    FrequencyView()
}
