//
// Final Project builds upon Assignment 3.
// Lauren Thompson CPSC5430 November - December 2023
//
//  RecipeCardFetcher.swift
//  Assignment3
//
//  Created by Lauren Thompson on 11/18/23.
//

import Foundation


struct RecipeCardFetcher {
    let apiKey = "f39cf73ed0834c3f8712af0da79e2f94"  // Verified 11/18/23

    func fetchRecipeCard(for recipeId: Int, completion: @escaping (Result<RecipeCard, Error>) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/\(recipeId)/card?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data or invalid response"])))
                return
            }

            do {
                let recipeCard = try JSONDecoder().decode(RecipeCard.self, from: data)
                completion(.success(recipeCard))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct RecipeCard: Codable {
    let url: URL
}

