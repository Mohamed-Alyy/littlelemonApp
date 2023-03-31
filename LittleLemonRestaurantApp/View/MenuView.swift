//
//  Menu.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import SwiftUI
import CoreData

struct MenuView: View {
   
    @Environment(\.presentationMode) var presentaionMode
    @Environment(\.managedObjectContext) var viewContext
  
    @State var searchText = ""
    
    var body: some View {
        VStack{
            NavigationView {
                
                FetchedObjects(predicate: Helper.buildPredicate(searchText: searchText), sortDescriptors: Helper.buildSortDescriptor()) {(dishes: [Dish]) in
                    
                    List{
                        ForEach(dishes) { dish in
                            
                            NavigationLink(destination: DishView(dish: dish)) {
                                
                                HStack{
                                    VStack (alignment: .leading){
                                        Text(dish.title!)
                                            .fontWeight(.bold)
                                            .fixedSize()
                                        Text(dish.descrip!)
                                            .fontWeight(.thin)
                                        Text("$\(dish.price!)")
                                            .fontWeight(.bold)
                                        
                                    }
                                    
                                    Spacer()
                                    AsyncImage(url: URL(string: dish.image!)) { image in
                                        image.resizable()
                                            .frame(width: 100 , height: 100)
                                            .cornerRadius(10)
                                        
                                    } placeholder: {
                                        ProgressView()
                                        
                                    }
                                }
                                
                            }
                        }
                        .listStyle(.grouped)
                    }
                }
                .searchable(text: $searchText)
            }// navigation view
            .onAppear {
                Helper.getMenuData(from: Helper.Url, context: viewContext)
                
            }
        }// main vstack
        
        
    } // body end
    
    
}// struct end


struct Menu_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MenuView()//.environmentObject(MenuItem())
    }
}

