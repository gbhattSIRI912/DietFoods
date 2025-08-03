//
//  Meal.swift
//  DietFoods
//
//  Created by Gaurav on 01/08/25.
//

import Foundation

struct Meal: Identifiable {
    var id = UUID()
    var name: String
    var time: String
    var imageName: String
    var duration: String
}

let sampleMeals: [Meal] = [
    Meal(name: "Peach Rice Pudding", time: "6AM", imageName: "meal", duration: "30 mins"),
    Meal(name: "Peach Rice Pudding Recipe", time: "8AM", imageName: "meal", duration: "30 mins"),
    Meal(name: "Peach Rice Pudding Recipe", time: "8AM", imageName: "meal", duration: "30 mins")
]


struct MealSection: Identifiable {
    let id = UUID()
    let title: String
    let timeRange: String
    let meals: [Meal]
}

//Api response
struct DietResponse: Codable {
    let status: String
    let message: String
    let data: DietData
}

// MARK: - Diet Data
struct DietData: Codable {
    let diets: DietsModel
}

// MARK: - Diets
struct DietsModel: Codable {
    let dietStreak: [String]
    let allDiets: [MealModel]?
}



// MARK: - Meal
struct MealModel: Codable {
    let daytime: String
    let timings: String
    let progressStatus: ProgressStatus
    let recipes: [Recipe]
}

// MARK: - Progress Status
struct ProgressStatus: Codable {
    let total: Int
    let completed: Int
}

// MARK: - Recipe
struct Recipe: Codable {
    let id: Int
    let title: String
    let timeSlot: String
    let duration: Int
    let image: String
    let isFavorite: Int
    let isCompleted: Int
}




struct DietSection: Identifiable {
    let id = UUID()
    let daytime: String
    let timings: String
    let progressStatus: ProgressStatus
    let meals: [Meal]
    
    struct ProgressStatus {
        let total: Int
        let completed: Int
    }
}


