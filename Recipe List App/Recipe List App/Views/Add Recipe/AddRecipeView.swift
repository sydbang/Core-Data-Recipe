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
    
    var body: some View {
        VStack {
            // HStack with the form controls
            HStack {
                Button("Clear") {
                    // Clear the form
                }
                Spacer()
                Button("Add") {
                    // Add recipe to the core data and clear the form
                    
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
                    
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
