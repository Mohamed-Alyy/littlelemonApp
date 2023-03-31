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

let userIsLoggedIn = UserDefaults.standard.bool(forKey: Helper.kIsLoggedIn)

    
    var body: some View {
NavigationView {

VStack {
    LogoView()
   // Spacer()
    ScrollView {
        VStack{
            
            HeroView()
            
            profileImageView()
           // Spacer()
            VStack(spacing: 20) {
                RegistrationTFView(title: "First Name", binding: $firstName)
                RegistrationTFView(title: "Last Name", binding: $lastName)
                RegistrationTFView(title: "Email", binding: $email)
            }
            .padding(.horizontal)
            
            //MARK: Registration Button
            NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                Button {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        showRegistrationAlert = true
                        
                    }else if !email.contains("@"){
                        print("this not valide email")
                        showGoToHomeScreenAlert = true
                        
                    } else {
                      
                        svaeUserData()
                        
                        isLoggedIn = true
                    }
                } label: {
                    Text("Register")
                }
                .frame(maxWidth: .infinity,minHeight: Helper.tfHeight)
                .background(Color.yellow)
                .foregroundColor(.black)
                .font(.title)
                .cornerRadius(Helper.tfCornerRadius)
                .alert("😕 Please fill all fields😕 ", isPresented: $showRegistrationAlert) {
                    Button("Ok", role: .cancel) {
                        //
                    }
                }
                .alert("😕This is not valid email😕 ", isPresented: $showGoToHomeScreenAlert) {
                    Button("Ok", role: .cancel) {
                        //
                    }
                }
                
            }//NavigationLink
            .padding(.horizontal)
            .padding(.top,50)
            
        }
         
    }
}

}
.onAppear {
    if userIsLoggedIn {
        isLoggedIn = true
    }
}

} // Some View
    
    fileprivate func svaeUserData() {
        UserDefaults.standard.set(firstName, forKey: Helper.kFirstName)
        UserDefaults.standard.set(lastName, forKey: Helper.kLasttName)
        UserDefaults.standard.set(email, forKey: Helper.kEmail)
        UserDefaults.standard.setValue(true, forKey: Helper.kIsLoggedIn)
    }
}



struct Onboarding_Previews: PreviewProvider {
static var previews: some View {
OnboardingView()
}
}
