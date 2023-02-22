//
//  Menu.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import SwiftUI
import CoreData

struct MenuView: View {
    @EnvironmentObject var menuItem: MenuItem
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [
            SortDescriptor(\Dish.title, order: .reverse)
        ]
    ) var dishes: FetchedResults<Dish>
    
    
    var body: some View {
        VStack{
            Text("App Name")
            Text("Location")
            Text("Description")
            
            List{
                ForEach(dishes) { dish in
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            Text(dish.title!)
                            Text("Price:\(dish.price!) $")
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image.resizable()
                                    .frame(width: 100 , height: 100)
                            } placeholder: {
                                ProgressView()
                                    
                            }

                        }
                    }
                  
                }
            }
            
        }
        .onAppear {
            
            getMenuData(from: K.Url)
        }
        
    } // body end
        
    
        func getMenuData (from basUrl: String){
            PersistenceController().clear()
            let session = URLSession(configuration: .default)
            let url = URL(string: basUrl)
            let task = session.dataTask(with: url!) { data, response, error in
                if  error != nil {
                    print(error!)
                }else{
                    if let myData = data {
                        
                        let decoder = JSONDecoder()
                        let decodedData = try? decoder.decode(MenuList.self, from: myData)
                        let menuList = decodedData
                        
                        for menu in menuList!.menu {
                            let newDish = Dish(context: viewContext)
                            newDish.title = menu.title
                            newDish.price = menu.price
                            newDish.image = menu.image
                            
                            try? viewContext.save()
                        }
                        
                    }
                }
                
            }
            task.resume()
            
        }// function end
    
    
    }// struct end

    
    struct Menu_Previews: PreviewProvider {
        static var previews: some View {
        
            MenuView()
        }
    }
    