//
//  Dish+CoreDataClass.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 22/02/2023.
//
//

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
//        return NSFetchRequest<Dish>(entityName: "Dish")
//    }
    
//     private static func request() -> NSFetchRequest<NSFetchRequestResult> {
//                let request: NSFetchRequest<NSFetchRequestResult> =
//                   NSFetchRequest(entityName: String(describing: Self.self))
//                request.returnsDistinctResults = true
//                request.returnsObjectsAsFaults = true
//                return request
//        }
    
     static func request () -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        
        return request
    }
}
