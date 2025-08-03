//
//  DietStreakView.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import SwiftUI

struct DietStreakView: View {
    var dietStreak: [String]?
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Diet Streak")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.blue)
                    Text("1 Streak")
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .overlay(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1)
                )
            }
            
            HStack(spacing: 20) {
                    ForEach(dietStreak?.indices ?? 0..<0, id: \.self) { index in
                        let title = dietStreak?[index]
                        let status = statusFromString(dietStreak?[index] ?? "")
                        DietStreakCircle(title: "\(title ?? "")", status: status)
                    }

        
            }
            .padding(.top, 4)
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
    }
    
    func statusFromString(_ value: String) -> DietStatus {
        switch value.uppercased() {
        case "COMPLETED":
            return .success
        case "CURRENT":
            return .fail
        case "UPCOMING":
            return .success
        default:
            return .none
        }
    }
}

#Preview {
    DietStreakView()
}
