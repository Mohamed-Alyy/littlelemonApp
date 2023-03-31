//
//  LittleLemonRestaurantAppApp.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 19/02/2023.
//

import SwiftUI

@main
struct LittleLemonRestaurantAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
       
        WindowGroup {

            OnboardingView().environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
    
}
