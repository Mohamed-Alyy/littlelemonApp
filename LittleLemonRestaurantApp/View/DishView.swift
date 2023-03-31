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
    @State var dish: Dish
    
 
    
    var body: some View {
        
        VStack (alignment: .center){
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            .padding()

            HStack {
                Text(dish.title ?? "No title")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .fixedSize()
                Spacer()
                Text("$\(dish.price ?? "No Price")")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            VStack {
            
                
                Text(dish.descrip ?? "No discreption")
                    .fontWeight(.medium)
    //            Text("$\(dish.price)")
    //                .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

struct Dish_Previews: PreviewProvider {
  
    static var previews: some View {
        
        DishView( dish: Helper.sampleDish)
    }
}
