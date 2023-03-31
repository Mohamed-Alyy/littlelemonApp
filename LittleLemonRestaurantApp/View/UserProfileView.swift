//
//  UserProfile.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentaionMode
    @State var isLoggedOut = false
  
    
    let fristName = UserDefaults.standard.string(forKey: Helper.kFirstName)
    let lastNmae = UserDefaults.standard.string(forKey: Helper.kLasttName)
    let email = UserDefaults.standard.string(forKey: Helper.kEmail)
    let profileImage = UserDefaults.standard.string(forKey: Helper.kProfileImage)
  
    var body: some View {
        VStack{
            Text("Personal information")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding(.top, 100)
        

            profileImageView()
                
                .padding([.bottom,.top])
            HStack{
                VStack(alignment:.leading){
                    Text("Name:")
                        .padding(.bottom)
                    Text("email:")
                }
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.trailing)
                
                VStack(alignment:.leading){
                    Text(fristName!.capitalized + " " + lastNmae!.capitalized)
                        .padding(.bottom) 
                    Text(email!)
                }
                .font(.system(size: 20))
            }
        
            .padding(.bottom, 200)
            
            
            Button {
                //UserDefaults.standard.set(false, forKey: K.kIsLoggedIn)
                isLoggedOut = true
            } label: {
                Text("Exit")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity,minHeight: Helper.tfHeight)
            .background(Color("MainColor").opacity(0.8))
            .foregroundColor(.black)
            .font(.title)
            .cornerRadius(Helper.tfCornerRadius)
            .alert("You are Successfully logged out", isPresented: $isLoggedOut) {
                Button {
                    UserDefaults.standard.set(false, forKey: Helper.kIsLoggedIn)
                    presentaionMode.wrappedValue.dismiss()
                  //  exit(2)

                } label: {
                    Text("OK")
                }

            }
            .padding(.horizontal)
          //  Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
