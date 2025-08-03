//
//  SearchAndFilterView.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import SwiftUI

struct SearchAndFilterView: View {
    @Binding var searchText: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Search Meals")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                }

                TextField("", text: $searchText)
                    .padding(.horizontal, 12)
                    .frame(height: 45)
                    .cornerRadius(8)
            }
            .frame(height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
                        .cornerRadius(8)

            Button(action: {
                // Add filter action here
            }) {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.primary)
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    SearchAndFilterView(searchText: .constant(""))
}
