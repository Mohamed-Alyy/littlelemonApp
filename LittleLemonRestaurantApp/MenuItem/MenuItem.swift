//
//  MenuItem.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 25/03/2023.
//

import Foundation

// MARK: - MenuItem Class
class MenuItem : ObservableObject {
    @Published var menuList: MenuList = MenuList(menu: [])
//    init(menuList: MenuList) {
//        self.menuList = menuList
//    }
}
