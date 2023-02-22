//
//  Home.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import SwiftUI

struct HomeView: View {
   // let persistance = PersistenceController()
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfileView()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
