//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Check if we have preloaded the data into core data
        checkLoadedData()
    }
    
    func checkLoadedData() {
        // Check local storage for the flag
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded)
        
        // If it's false, then we parse the local json and preload
        if status == false {
            preloadLocalData()
        }
    }
    
    func preloadLocalData() {
        // Parse the local JSON File
        let localRecipes = DataService.getLocalData()
        // Create core data object
        
        // Save into Core Data
        
        // Set local storage flag
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num
        var denominator = ingredient.denum
        var wholePortions = 0
        
        // Get a single serving size by multiplying denominator by the recipe servings
        denominator *= recipeServings
        
        // Get target portion by multiplying numerator by target servings
        numerator *= targetServings
        
        // Reduce fraction by greatest common divisor
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        
        // Get the whole portion if numerator > denominator
        if numerator >= denominator {
            
            // Calculated whole portions
            wholePortions = numerator / denominator
            
            // Calculate the remainder
            numerator = numerator % denominator
            
            // Assign to portion string
            portion += String(wholePortions)
        }
        
        // Express the remainder as a fraction
        if numerator > 0 {
            
            // Assign remainder as fraction to the portion string
            portion += wholePortions > 0 ? " " : ""
            portion += "\(numerator)/\(denominator)"
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholePortions > 1 {
                
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denum == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
