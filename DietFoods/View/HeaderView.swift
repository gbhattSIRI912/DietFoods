//
//  HeaderView.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Everyday Diet Plan")
                    .font(.headline)
                Text("Track Ananya’s every meal")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                // Handle grocery list button action
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "cart")
                    Text("Grocery List")
                        .font(.caption2)
                }
                .foregroundColor(.primary)
            }
        }
        .padding(.horizontal)
    }
}
#Preview {
    HeaderView()
}
