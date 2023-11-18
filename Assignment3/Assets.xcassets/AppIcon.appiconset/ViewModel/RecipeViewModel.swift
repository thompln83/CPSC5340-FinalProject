//
// Final Project builds upon Assignment 3.
// Lauren Thompson CPSC5430 November - December 2023
//
//  RecipeViewModel.swift : Assignment3
//
//  Created by Lauren Thompson on 10/31/23.
//
// Lauren Thompson CPSC5430 October - November 2023

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    //private let apiKey = "b70353f167604d4fa7c4be3aa24d596d"
    let apiKey = "f39cf73ed0834c3f8712af0da79e2f94"  // Verified 11/18/23
    
    func fetchRecipes(ingredients: String) {
        let query = ingredients.replacingOccurrences(of: " ", with: "+")
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/findByIngredients?ingredients=\(query)&number=10&apiKey=\(apiKey)") else {
            print("Invalid URL.")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("Data is nil.")
                return
            }

            do {
                let fetchedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
                DispatchQueue.main.async {
                    self.recipes = fetchedRecipes
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}


// ****************************************
// From Assignment 3 Project
//
//  RecipeViewModel.swift : Assignment3
//
//  Created by Lauren Thompson on 10/31/23.
//
// Lauren Thompson CPSC5430 October - November 2023

//import Foundation
//
//class RecipeViewModel: ObservableObject {
//    @Published var recipes = [Recipe]()
//    //private let apiKey = "b70353f167604d4fa7c4be3aa24d596d"
//    let apiKey = "f39cf73ed0834c3f8712af0da79e2f94"
//    
//    func fetchRecipes(ingredients: String) {
//        let query = ingredients.replacingOccurrences(of: " ", with: "+")
//        
//        guard let url = URL(string: "https://api.spoonacular.com/recipes/findByIngredients?ingredients=\(query)&number=10&apiKey=\(apiKey)") else {
//            print("Invalid URL.")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print("Network error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("Data is nil.")
//                return
//            }
//
//            do {
//                let fetchedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
//                DispatchQueue.main.async {
//                    self.recipes = fetchedRecipes
//                }
//            } catch {
//                print("Decoding error: \(error.localizedDescription)")
//            }
//        }
//        .resume()
//    }
//}
