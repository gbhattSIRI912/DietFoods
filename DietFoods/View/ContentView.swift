//
//  ContentView.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var fedMeals: Set<String> = ["6AM"]
    @State private var selectedMeals: Set<UUID> = []
    @State private var selectAll = false
    @State private var dietStreak : DietData?
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HeaderView()
                    DietStreakView(dietStreak: dietStreak?.diets.dietStreak)
                    SearchAndFilterView(searchText: $searchText)
                    
                    if let meals = dietStreak?.diets.allDiets {
                        ForEach(meals.indices, id: \.self) { index in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(meals[index].daytime)")
                                        .font(.headline)
                                    Text("\(meals[index].timings)")
                                        .font(.subheadline)
                                }
                                Spacer()
                                CircularProgressView(current: meals[index].progressStatus.completed, total: meals[index].progressStatus.total)
                            }
                            .padding(.horizontal)
                            
                            Toggle(isOn: $selectAll) {
                                Text("Select All")
                                    .fontWeight(.semibold)
                            }
                            .toggleStyle(CheckToggleStyle())
                            .padding(.horizontal)
                            .onChange(of: selectAll) { value in
                                selectedMeals = value ? Set(sampleMeals.map { $0.id }) : []
                            }
                            
                            if let meals = dietStreak?.diets.allDiets {
                                ForEach(meals.indices, id: \.self) { index in
                                    MealCardWithCheckbox(
                                        isSelected: true,
                                        showToggle: selectAll,
                                        toggleSelection: {
                                        }, mealModel: dietStreak?.diets.allDiets?[index]
                                    )
                                }
                            }
                        }
                    }
                    
                    
                }
                
            }
            .padding(.bottom, 20)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            let service = DietAPIService()
            service.fetchAllDiets { result in
                switch result {
                case .success(let response):
                    print("Diet streak: \(response.data.diets.dietStreak)")
                    self.dietStreak = response.data
                    print("data model: \(self.dietStreak)")
                    print("Meals count: \(response.data.diets.allDiets?.count)")
                case .failure(let error):
                    print("Failed to fetch diets: \(error.localizedDescription)")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
