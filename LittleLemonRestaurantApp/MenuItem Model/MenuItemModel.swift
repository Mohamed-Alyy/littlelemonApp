//
//  MenuItemModel.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import Foundation

import Foundation

// MARK: - MenuItem Class
class MenuItem : ObservableObject {
    @Published var menuList: MenuList
    init(menuList: MenuList) {
        self.menuList = menuList
    }
}

// MARK: - MenuItem
struct MenuList: Codable {
    let menu: [MenuItemModel]
    
}

// MARK: - Menu
struct MenuItemModel: Codable , Identifiable {
    let id: Int
    let title, description, price: String
    let image: String
    let category: String
    
    
    
}
