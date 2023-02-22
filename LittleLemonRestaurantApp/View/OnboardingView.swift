//
//  Onboarding.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 19/02/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var showRegistrationAlert = false
    @State var showGoToHomeScreenAlert = false
    @State var isLoggedIn = false
   
  
    var body: some View {
        NavigationView {
            VStack(spacing: 15){
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                    Button {
                       
                        if firstName.isEmpty || lastName.isEmpty {
                            showGoToHomeScreenAlert.toggle()
                        }else{
                            isLoggedIn = true
                            UserDefaults.standard.set(isLoggedIn, forKey: K.kIsLoggedIn)
                        }
                    } label: {
                        Text("Home")
                    }
                    .alert("😕You are not register yet😕 ", isPresented: $showGoToHomeScreenAlert) {
                        Button("Ok", role: .cancel) {
                            //
                        }
                    }

                }
                
                TextField("First name", text: $firstName)
                    .padding(.leading ,10)
                    .frame(height: K.tfHeight)
                    .background(K.tfBgColor)
                    .cornerRadius(K.tfCornerRadius)
                TextField("Last name", text: $lastName)
                    .padding(.leading ,10)
                    .frame(height: K.tfHeight)
                    .background(K.tfBgColor)
                    .cornerRadius(K.tfCornerRadius)
                TextField(text: $email) {
                    Text("email")
                }
                .padding(.leading ,10)
                .frame(height: K.tfHeight)
                .background(K.tfBgColor)
                .cornerRadius(K.tfCornerRadius)
                
                Button {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        showRegistrationAlert.toggle()
                        
                    }else if !email.contains("@"){
                        print("this not valide email")
                        
                    } else {
                        print("Data Saved in UserDeafult")
                        UserDefaults.standard.set(firstName, forKey: K.kFirstName)
                        UserDefaults.standard.set(lastName, forKey: K.kLasttName)
                        UserDefaults.standard.set(email, forKey: K.kEmail)
                    }
                    
                } label: {
                    Text("Registration")
                }.alert("Please fill all required fields", isPresented: $showRegistrationAlert, actions: {
                    Button("OK", role: .cancel) {}
                })
                
                .frame(maxWidth: .infinity , maxHeight: K.tfHeight)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .font(.title3)
                .cornerRadius(K.tfCornerRadius)
                
            }
            .padding()
            .onAppear {
                let userIsLoggedIn = UserDefaults.standard.bool(forKey: K.kIsLoggedIn)
                if userIsLoggedIn {
                    isLoggedIn = true
                }
                
        }
      
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
