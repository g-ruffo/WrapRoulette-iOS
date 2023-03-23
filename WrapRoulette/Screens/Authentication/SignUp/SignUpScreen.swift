//
//  SignUp.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI

struct SignUpScreen: View {

    @State private var buttonIsEnabled: Bool = true
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var department: String = ""
    @State private var password: String = ""
    @State var nameAttempts: CGFloat = 0
    @State var emailAttempts: CGFloat = 0
    @State var passwordAttempts: CGFloat = 0
    
    var body: some View {

        NavigationView {
            VStack {
                Spacer()
                titleHeader
                textFields
                signUpButton
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BluePrimary"))
            .ignoresSafeArea()
            .applyBackButon()
        }
    }
    
        var titleHeader: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text("signUpTitle")
                    .font(.system(size: logoTextSize))
                    .foregroundColor(Color("LoginTextDarkBackgroundColor"))
                
                Text("signUpSubtitle")
                    .font(.system(size: headerSubtitleSize))
                    .foregroundColor(Color("LoginTextDarkBackgroundColor"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, horizontalTextFieldSpacerWidth)
            .padding(.bottom, 42)
        }
    
    var textFields: some View {
        VStack {
            StandardTextField(leadingIcon: "person", textHint: "Enter your name", textInput: $email, inputType: .alphabet, invalidAttempts: $emailAttempts)
                .autocapitalization(.words)
                .autocorrectionDisabled()
            
            EmailTextField(textInput: $email, inputType: .emailAddress, invalidAttempts: $emailAttempts)
            
            StandardTextField(leadingIcon: "building.2.crop.circle", textHint: "Enter your department", textInput: $email, inputType: .alphabet, invalidAttempts: $emailAttempts)
                .autocapitalization(.words)
                .autocorrectionDisabled(false)
            
            PasswordTextField(textHint: "Enter your password", textInput: $password, invalidAttempts: $passwordAttempts)
                .padding(.bottom, 44)
        }
    }

    var signUpButton: some View {
        return SubmitButton(text: "Sign Up", isEnabled: $buttonIsEnabled) {
            withAnimation(.easeInOut) {
                emailAttempts += 1
                nameAttempts += 1
                passwordAttempts += 1

            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
