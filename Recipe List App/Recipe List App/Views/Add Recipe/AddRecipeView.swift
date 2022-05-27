//
//  AddRecipeView.swift
//  Recipe List App
//
//  Created by Sunghee Bang on 2022-05-25.
//

import SwiftUI

struct AddRecipeView: View {
    
    // Properties for recipe meta data
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    // List type recipe meta data
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    // Ingredient data
    @State private var ingredients = [IngredientJSON]()  // we dont want to use Ingredient (core data) because we don't want to save to core data yet
    
    var body: some View {
        VStack {
            // HStack with the form controls
            HStack {
                Button("Clear") {
                    // Clear the form
                    clear()
                }
                Spacer()
                Button("Add") {
                    // Add recipe to the core data and clear the form
                    addRecipe()
                    
                    clear()
                }
            }
            // Scroll view
            ScrollView(showsIndicators: false) {
                VStack {
                    // The recipe meta data
                    AddMetaData(name: $name,
                                summary: $summary,
                                cookTime: $cookTime,
                                prepTime: $prepTime, 
                                totalTime: $totalTime,
                                servings: $servings)
                    // List data
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetarian")
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add the oil to the pan")
                    
                    // Ingredient Data
                    AddIngredientData(ingredients: $ingredients)
                    
                }
            }
            
        }
        .padding(.horizontal)
    }
    
    
    func clear() {
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        highlights = [String]()
        directions = [String]()
        ingredients = [IngredientJSON]()
    }
    
    func addRecipe() {
        
    }
}


struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
