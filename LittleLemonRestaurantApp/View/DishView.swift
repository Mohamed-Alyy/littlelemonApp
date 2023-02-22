//
//  Dish.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 21/02/2023.
//

import SwiftUI
import CoreData

struct DishView: View {
   // @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var menuItem : MenuItem
   // var selectedItem = menuItem.menuList.menu.
    
    var body: some View {
        Text("")
    }
}

struct Dish_Previews: PreviewProvider {
    static var previews: some View {
        DishView()
    }
}
