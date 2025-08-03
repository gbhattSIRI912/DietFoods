//
//  MealCardWithCheckbox.swift
//  DietFoods
//
//  Created by Gaurav on 02/08/25.
//

import SwiftUI

struct MealCardWithCheckbox: View {
    //let meal: Meal
    var isSelected: Bool
    var showToggle: Bool
    var toggleSelection: () -> Void
    let mealModel: MealModel?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach((mealModel?.recipes.indices)!, id: \.self) { index in
            HStack(alignment: .top) {
                if showToggle {
                    Toggle("", isOn: .constant(isSelected))
                        .labelsHidden()
                        .toggleStyle(CheckToggleStyle())
                        .onTapGesture {
                            toggleSelection()
                        }
                }

                Text("\(mealModel?.recipes[index].timeSlot ?? "")")
                    .font(.headline)
                Spacer()
            }
            .padding(.leading, 4)
            
                MealCardView(recipes: mealModel?.recipes[index])
            }
          
        }
        .padding(.horizontal)
    }
}


struct MealCardView: View {
    let recipes: Recipe?
    var body: some View {
        HStack(spacing: 12) {
            // Image
            AsyncImage(url: URL(string: recipes?.image ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 90, height: 125)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 90, height: 125)
                        .clipped()
                        .cornerRadius(12)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 125)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }

            
            VStack(alignment: .leading, spacing: 6) {
                // Title and Favorite Icon
                HStack {
                    Text(recipes?.title ?? "")
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                }
                
                // Time
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    Text("\(recipes?.duration ?? 0) mins")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white)
                .cornerRadius(6)
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
                
                Divider()
                    .padding(.vertical, 2)
                
                // Buttons
                HStack(spacing: 12) {
                    // Customize Button
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image(systemName: "slider.horizontal.3")
                            Text("Customize")
                                .font(.caption2)
                        }
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.blue)
                        .cornerRadius(20)
                    }

                    // Fed Button
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.circle")
                            Text("Fed")
                        }
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    }
                }
            }
        }
        .padding()
        .background(Color(red: 0.96, green: 0.94, blue: 1.0)) // Light purple shade
        .cornerRadius(20)
        .padding(.horizontal, 8)
    }
}

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
                .font(.body)
        }
    }
}
