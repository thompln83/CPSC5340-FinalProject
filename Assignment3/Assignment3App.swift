//
// Final Project builds upon Assignment 3.
// Lauren Thompson CPSC5430 November - December 2023
//
// Assignment3App.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.
//
// Lauren Thompson CPSC5430 October - November 2023

// For Final Project
import SwiftUI

@main
struct Assignment3App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainInputView()
            }
        }
    }
}

// Final Project Directory:
//
// Assignment3App/
// |-- Assignment3App.swift
// |
// |-View
// |-- RecipeDetailView.swift   // Recipe details view;
// |                                modified from Assignment3App
// |-- MainInputView.swift      // Main view for input and listing recipes;
// |                                modified from Assignment3App
// |
// |- ViewModel
// |-- RecipeViewModel.swift    // Model for viewing recipe details;
// |                                recyled from Assignment3App
// |-- RecipeCardFetcher.swift  // Model for recipe card;
// |                                new file created for Final Project
// |-Models
// |-- RecipeModel.swift        // data fetching;
// |                                recyled from Assignment3App
// |______________________________________________________

// ********************************************************

// Assignment3App Directory:
//
// Assignment3App/
// |-- Assignment3App.swift
// |
// |-View
// |-- ContentView.swift        // Default - Removing for Final Project
// |-- RecipeDetailView.swift   // view for showing recipe details
// |-- MainInputView.swift      // Main view for input and listing recipes
// |
// |- ViewModel
// |-- RecipeViewModel.swift
// |
// |-Models
// |-- RecipeViewModel.swift    // Recipe view model for data fetching and
// |
// |______________________________________________________


// ****************************************
// From Assignment 3 Project

// Assignment3App.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.
//
// Lauren Thompson CPSC5430 October - November 2023
//
//import SwiftUI
//
//@main
//struct Assignment3App: App {
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                MainInputView()
//            }
//        }
//    }
//}
//
// Assignment3App Directory: 

// Assignment3App/
// |-- Assignment3App.swift
// |
// |-View
// |-- ContentView.swift        // Default - Removing* ?
// |-- RecipeDetailView.swift   // view for showing recipe details
// |-- MainInputView.swift      // Main view for input and listing recipes
// |
// |- ViewModel
// |-- RecipeViewModel.swift
// |
// |-Models
// |-- RecipeViewModel.swift    // Recipe view model for data fetching and
// |
