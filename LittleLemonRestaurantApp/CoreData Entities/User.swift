//
//  User.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 31/03/2023.
//

import Foundation
import CoreData

class User: NSManagedObject {
    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var email: String
    @NSManaged public var photo: Data
}
