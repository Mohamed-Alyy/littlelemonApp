//
//  BreakdownView.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 29/03/2023.
//

import SwiftUI

struct BreakdownView: View {
    let breakDown = ["Starters", "Mains" , "Desserts" , "Drinks"]
    let rowLayout : [GridItem] = [GridItem(.flexible(), spacing: 10, alignment: .center)]
    var body: some View {
        
      //  ScrollView {
            
            VStack(alignment: .leading) {
                Text("ORDER FOR DELIVERY!")
                    .fontWeight(.bold)
                LazyHGrid(rows: rowLayout) {
                    ForEach(breakDown , id: \.self) { item in
                        Text(item)
                            .fontWeight(.bold)
                            .frame(width: 80,height: 50)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(16)
                            
                   // }
                }
            }
        }
    }
}

struct BreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownView()
    }
}
