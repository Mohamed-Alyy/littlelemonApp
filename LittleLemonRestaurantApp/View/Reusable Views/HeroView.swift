//
//  HeroView.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 22/03/2023.
//

import SwiftUI

struct HeroView: View {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    var body: some View {
        ZStack(){
            Rectangle()

                .frame(width: width,height: height * 0.25)
                .scaledToFit()
                .foregroundColor(Color("MainColor"))
            VStack(alignment: .leading){
                Text("Littel Lemon")
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                    .foregroundColor(.yellow)
                    
                Text("Checago")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    
                HStack{
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Image("Dish")
                        .resizable()
                        .frame(width: width / 4 ,height: height / 8)
                        .cornerRadius(15)
                       
                }// HStack
               
                    
            } // VStack
           // .padding(5)
            
        } // zstack
  
    }
    
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
