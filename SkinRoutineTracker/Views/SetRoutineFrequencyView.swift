//
//  SetRoutineFrequencyView.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.10.2025.
//


import SwiftUI

struct SetRoutineFrequencyView: View {
    @State private var selectedFrequency: String? = nil
    @State private var selectedTimes: Set<String> = []
    
    let frequencies = ["Daily", "Every 2 Days", "Weekly", "Custom"]
    let timeOptions = ["Morning", "Evening", "Both"]
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Başlık
            VStack(spacing: 8) {
                Image(systemName: "clock.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                Text("Set Routine Frequency")
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding(.top, 60)
            
            // Frequency Selection
            VStack(alignment: .leading, spacing: 10) {
                Text("How often do you use this product?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                
                ForEach(frequencies, id: \.self) { frequency in
                    FrequencyRow(title: frequency, isSelected: selectedFrequency == frequency)
                        .onTapGesture {
                            withAnimation {
                                selectedFrequency = frequency
                            }
                        }
                }
            }
            
            // Time of Day
            VStack(alignment: .leading, spacing: 10) {
                Text("When do you apply it?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                
                ForEach(timeOptions, id: \.self) { time in
                    TimeRow(title: time, isSelected: selectedTimes.contains(time))
                        .onTapGesture {
                            withAnimation {
                                if selectedTimes.contains(time) {
                                    selectedTimes.remove(time)
                                } else {
                                    selectedTimes.insert(time)
                                }
                            }
                        }
                }
            }
            
            Spacer()
            
            // Next Button
            Button(action: {
                print("Selected: \(selectedFrequency ?? "None") — \(selectedTimes.joined(separator: ", "))")
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedFrequency == nil || selectedTimes.isEmpty ? Color.gray.opacity(0.3) : Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal, 32)
            }
            .disabled(selectedFrequency == nil || selectedTimes.isEmpty)
            .padding(.bottom, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

// MARK: - Reusable Rows
struct FrequencyRow: View {
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

struct TimeRow: View {
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
    SetRoutineFrequencyView()
}
