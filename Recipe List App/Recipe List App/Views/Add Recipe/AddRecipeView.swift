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
    
    // Recipe Image
    @State private var recipeImage: UIImage?
    
    // Image Picker
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State private var placeHolderImage = Image("noImageAvailable")
    
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
                    
                    // Recipe image
                    placeHolderImage
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Button("Photo Library") {
                            isShowingImagePicker = true
                            selectedImageSource = .photoLibrary
                        }
                        Text(" | ")
                        Button ("Camera") {
                            isShowingImagePicker = true
                            selectedImageSource = .camera
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedSource: selectedImageSource, recipeImage: $recipeImage)
                    }
                    
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
    
    func loadImage() {
        // Check if an image was selected from the library
        if recipeImage != nil {
            // Set it as the placeholder image
            placeHolderImage = Image(uiImage: recipeImage!)
        }
    }
}


struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
