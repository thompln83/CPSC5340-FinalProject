//
// Final Project builds upon Assignment 3.
// Lauren Thompson CPSC5430 November - December 2023
//
//  MainInputView.swift : Assignment3
//
//  Created by Lauren Thompson on 11/2/23.
//
//  Lauren Thompson CPSC5430 October - November 2023


//
import SwiftUI

struct MainInputView: View {
    
    @State private var ingredients = ""
    
    @ObservedObject var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            
            VStack {
                
                Spacer()
                
                // Create a Text view with italics for specific words
                Text("'What's For Dinner?' helps you make epic meals from everyday leftovers.")
                    .padding(5)
   
                Text("Discover delightful recipes using your available ingredients.")
                    .padding(5)
                
                // Text Field
                TextField("Enter ingredient(s): Basil, fish, parsley", text: $ingredients)
                    .padding(10)
                    .border(Color.gray)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .fontWeight(.bold)
                
                Image("whatsForDinner")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .frame(width: 175, height: 175)
                
                Button("Search Recipes") {
                    viewModel.fetchRecipes(ingredients: ingredients)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .padding()
            
                
                Text("⇣    Scroll Recipes Below    ⇣")
                    .padding()
                    .font(.system(size: 14))
                
                List(viewModel.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            Text(recipe.title)
                            Spacer()
                            Text("\(recipe.usedIngredientCount) ingredients used")
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("🍴What's for Dinner?", displayMode: .inline)
            .onAppear {
                UIDevice.current.beginGeneratingDeviceOrientationNotifications()
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    if UIDevice.current.orientation.isLandscape {
                        // Handle landscape orientation
                        // You can customize the view for landscape here if needed
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use StackNavigationViewStyle for landscape
    }
}



// Preview
struct MainInputView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainInputView()
        }
    }
}



// ****************************************
// From Assignment 3 Project
//
//  MainInputView.swift : Assignment3
//
//  Created by Lauren Thompson on 11/2/23.
//
//  Lauren Thompson CPSC5430 October - November 2023

//import SwiftUI
//
//struct MainInputView: View {
//    
//    @State private var ingredients = ""
//    
//    @ObservedObject var viewModel = RecipeViewModel()
//
//    var body: some View {
//       
//        VStack {
//            
//            
//            Text("Discover delightful recipes using your available ingredients.")
//               //.fontWeight(.bold)
//                .padding()
//           
//            // Text Field
//            TextField("Enter ingredient(s), followed by a comma", text: $ingredients)
//            
//            // Stylized
//                .padding()
//                .border(Color.gray)
//                .autocapitalization(.none)
//                .disableAutocorrection(true)
//                .fontWeight(.bold)
//           
//            Text("Recipe Finder offers a detailed view of each recipe, highlighting the number of ingredients you've used.")
//                .padding()
//            
//            Image("Image")
//                // Stylized
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(5)
//                .frame(width: 125, height: 125)
//                
//            Button("Search Recipes") {
//                viewModel.fetchRecipes(ingredients: ingredients)
//            }
//
//            // Stylized
//            .buttonStyle(.bordered)
//           
//            Text("⇣    Scroll Recipes Below    ⇣")
//                .padding()
//                .font(.system(size:12))
//             
//            
//            List(viewModel.recipes) { recipe in
//                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
//                    HStack {
//                        Text(recipe.title)
//                        Spacer()
//                        Text("\(recipe.usedIngredientCount) ingredients used")
//                    }
//                    .padding()
//                }
//            }
//            
//        }
//        .navigationTitle("Recipe Finder: 🍴")
//    }
//}
//
//// Preview
//struct MainInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MainInputView()
//        }
//    }
//}
