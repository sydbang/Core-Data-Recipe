//
//  Ingredient+CoreDataProperties.swift
//  Recipe List App
//
//  Created by Sunghee Bang on 2022-05-15.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var num: Int64
    @NSManaged public var denum: Int64
    @NSManaged public var unit: String?
    @NSManaged public var recipe: Recipe?

}

extension Ingredient : Identifiable {

}
