//
//  CircularProgressView.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import SwiftUI

struct CircularProgressView: View {
    let current: Int
    let total: Int

    var progress: CGFloat {
        CGFloat(current) / CGFloat(total)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 5)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(.degrees(-90))
            VStack {
                Text("Status")
                    .font(.caption2)
                Text("\(current) of \(total)")
                    .font(.caption)
                    .fontWeight(.medium)
            }
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    CircularProgressView(current: 30, total: 100)
}
