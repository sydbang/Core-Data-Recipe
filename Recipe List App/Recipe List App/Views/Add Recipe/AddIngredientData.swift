//
//  AddIngredientData.swift
//  Recipe List App
//
//  Created by Sunghee Bang on 2022-05-27.
//

import SwiftUI

struct AddIngredientData: View {
    
    @Binding var ingredients: [IngredientJSON]
    
    @State private var name = ""
    @State private var unit = ""
    @State private var num = ""
    @State private var denum = ""
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Ingredients: ")
                .bold()
                .padding(.top, 5)
            
            HStack {
                
                TextField("Sugar", text: $name)
                TextField("1", text: $num)
                    .frame(width: 20)
                Text("/")
                TextField("2", text: $denum)
                    .frame(width: 20)
                TextField("cups", text: $unit)
                
                Button("Add") {
                    
                    // Make sure that the fields are not populated
                    let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedNum = num.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedDenum = denum.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedUnit = unit.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    if cleanedName == "" || cleanedNum == "" || cleanedDenum == "" || cleanedUnit == "" {
                        return
                    }
                    
                    // Create an ingredientJSON object and set it's properties
                    let i = IngredientJSON()
                    i.id = UUID()
                    i.name = cleanedName
                    i.num = Int(cleanedNum) ?? 1
                    i.denum = Int(cleanedDenum) ?? 1
                    i.unit = cleanedUnit
                    
                    // Add this ingredient to the list
                    ingredients.append(i)
                    
                    // Clear text fields
                    name = ""
                    num = ""
                    denum = ""
                    unit = ""
                }
            }
            
            ForEach (ingredients) { ingredient in
                
                Text("\(ingredient.name), \(ingredient.num ?? 1)/\(ingredient.denum ?? 1) \(ingredient.unit ?? "")")
                
            }
        }
    }
}

