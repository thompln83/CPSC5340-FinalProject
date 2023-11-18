//
// Final Project builds upon Assignment 3.
// Lauren Thompson CPSC5430 November - December 2023
//
//  RecipeDetailView.swift : Assignment3
//
//  Created by Lauren Thompson on 10/31/23.
//
//  Lauren Thompson CPSC5430 October - November 2023


import SwiftUI
import SafariServices

struct RecipeDetailView: View {
    var recipe: Recipe
    @State private var showSafari = false
    @State private var recipeCardURL: URL?
    @State private var showingErrorAlert = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            
            Image("recipeCards")
                .resizable()
                .scaledToFit()
                .cornerRadius(5)
                .frame(width: 175, height: 175)
            
            

            Text("Recipe Finder offers a detailed view of each recipe's ingredients and preparation instructions on its own recipe card.")
                .padding()
            
           
            Button("View Recipe Card") {
                fetchRecipeCard(for: recipe.id)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(40)
            .padding()

            if showSafari, let url = recipeCardURL {
                SafariView(url: url)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .alert(isPresented: $showingErrorAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }

    func fetchRecipeCard(for recipeId: Int) {
        RecipeCardFetcher().fetchRecipeCard(for: recipeId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipeCard):
                    self.recipeCardURL = recipeCard.url
                    self.showSafari = true
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showingErrorAlert = true
                }
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        // No update needed
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRecipe = Recipe(
            id: 1,
            title: "Sample Recipe",
            image: "sampleRecipeImage",
            usedIngredientCount: 5
            
        )
        
        return RecipeDetailView(recipe: sampleRecipe)
    }
}





// ****************************************
// From Assignment 3 Project
//
//  RecipeDetailView.swift : Assignment3
//
//  Created by Lauren Thompson on 10/31/23.
//
//  Lauren Thompson CPSC5430 October - November 2023

//
//import SwiftUI
//
// RecipeDetailView
//struct RecipeDetailView: View {
//    var recipe: Recipe
//
//    var body: some View {
//        
//        VStack {
//            
//            // URL: data & image
//            if let url = URL(string: recipe.image), let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
//                
//                // Stylized image
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFit()
//            }
//
//            // Recipe Title
//            Text(recipe.title)
//                .font(.title)
//
//            // Used ingredient count
//            Text("Used ingredients count: \(recipe.usedIngredientCount)")
//                .font(.title2)
//        }
//        .padding()
//        .navigationTitle(recipe.title)
//    }
//}
//
//// Preview
//struct RecipeDetailView_Previews: PreviewProvider {
//    
//    // mockRecipe for display
//    static var mockRecipe: Recipe {
//        
//        // Recipe, usedIngredientCount, & image
//        return Recipe(id: 12345, title: "Spaghetti Carbonara", image: "https://www.jocooks.com/wp-content/uploads/2012/05/creamy-carbonara-1.jpg", usedIngredientCount: 3)
//    }
//    
//    // Preview- NavigationView
//    static var previews: some View {
//        NavigationView {
//            RecipeDetailView(recipe: mockRecipe)
//        }
//    }
//}
//
