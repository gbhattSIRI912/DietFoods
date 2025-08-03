//
//  DietStreakCircle.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import SwiftUI

enum DietStatus {
    case success, fail, none
}

struct DietStreakCircle: View {
    let title: String
    let status: DietStatus

    var body: some View {
        VStack(spacing: 6) {
            Text(title)
                .font(.caption2)
                .foregroundColor(.black)
            Group {
                switch status {
                case .success:
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                case .fail:
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.5))
                                .frame(width: 32, height: 32)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                case .none:
                    Image(systemName: "circle")
                        .foregroundColor(.gray.opacity(0.5))
                }
            }
            .font(.system(size: 24))


        }
    }
}

#Preview {
    DietStreakCircle(title: "Morning", status: .fail)
}
