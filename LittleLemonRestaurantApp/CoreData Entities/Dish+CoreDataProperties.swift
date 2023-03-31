//
//  Dish+CoreDataProperties.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 22/02/2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
    @NSManaged public var descrip: String?

}

extension Dish : Identifiable {

}
