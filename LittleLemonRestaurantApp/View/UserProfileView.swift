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
    let fristName = UserDefaults.standard.string(forKey: K.kFirstName)
    let lastNmae = UserDefaults.standard.string(forKey: K.kLasttName)
    let email = UserDefaults.standard.string(forKey: K.kEmail)
    
    var body: some View {
        VStack{
            Text("Personal information")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(10)
            
            Text("First name: \(fristName ?? "") ")
            Text("Last name: \(lastNmae ?? "") ")
            Text("Email: \(email ?? "") ")
                .padding(.bottom , 20)
            
            Button {
                UserDefaults.standard.set(false, forKey: K.kIsLoggedIn)
                isLoggedOut = true
            } label: {
                Text("Logg Out")
            }
            .alert("You are Successfully logged out", isPresented: $isLoggedOut) {
                Button {
                    presentaionMode.wrappedValue.dismiss()
                } label: {
                    Text("OK")
                }

            }
          //  Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
