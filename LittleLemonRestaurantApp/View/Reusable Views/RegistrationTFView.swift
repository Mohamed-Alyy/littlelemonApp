//
//  TextFieldView.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 22/03/2023.
//

import SwiftUI

struct RegistrationTFView: View {
    var title: String
    var binding: Binding<String>
    var body: some View {
        TextField(title, text: binding)
            .padding(.leading ,10)
            .frame(height: Helper.tfHeight)
            .cornerRadius(Helper.tfCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1))
    }
}

struct RegistrationTFView_Previews: PreviewProvider {
    static var previews: some View {
        let title = "test"
        
        RegistrationTFView(title: title, binding: Helper.$kPindingString)
    }
}
