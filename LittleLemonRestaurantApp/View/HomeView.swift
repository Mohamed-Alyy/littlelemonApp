//
//  Home.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import SwiftUI

struct HomeView: View {

    let image = UserDefaults.standard.string(forKey: Helper.kProfileImage)

    var body: some View {
        

        VStack {
          
            TabView {
              
                //MARK: - MenuView tab
                VStack {
                    //MARK: LogoView
                    if let photo = image{
                        var newPhoto = Helper.imageFromString(image: photo)
                        HStack{
                           
                            LogoView()
                            Spacer()
                            Image(uiImage: newPhoto)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Capsule())
                        }
                        
                        .padding(.horizontal)
                        .onChange(of: image) { newValue in
                            newPhoto = getProfileImage(from: newValue)
                        }
                    } else {
                        HStack{
                            LogoView()
                            Spacer()
                            Image(uiImage: Helper.kSampleImage!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Capsule())
                        }
                    }
                    
                    
                    ScrollView {
                        
                        HeroView()
                        //MARK: Menu Breakdown
                        BreakdownView()
                        
                        //MARK: Menu view
                        MenuView()
                           
                        }
               
                }
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
            }
                //MARK: - UserProfileView tab
                UserProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    func getProfileImage(from image : String?)->UIImage{
        var profileImage: UIImage?
        if let image = image {
             let photo = Helper.imageFromString(image: image)
               profileImage = photo
        }else{
            profileImage = Helper.kSampleImage
        }
        return profileImage!
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
