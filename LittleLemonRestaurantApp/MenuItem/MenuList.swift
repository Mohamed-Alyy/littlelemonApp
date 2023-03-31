//
//  MenuItemModel.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//


import Foundation



// MARK: - MenuItem
struct MenuList: Codable {
    let menu: [MenuItemModel]
    
}

// MARK: - Menu
struct MenuItemModel: Codable , Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
    
    
    
}
