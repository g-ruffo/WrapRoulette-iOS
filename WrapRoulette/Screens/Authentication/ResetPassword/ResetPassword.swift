//
//  ResetPassword.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI

let headerTitleSize: CGFloat = 34
let headerSubtitleSize: CGFloat = 16

struct ResetPassword: View {
    
    @State private var buttonIsEnabled: Bool = true
    @State private var email: String = ""
    @State var emailAttempts: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            logoHeader
            textFields
            loginButton
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()
    }
    
    var logoHeader: some View {
        VStack {
            Text("resetPasswordTitle")
                .font(.system(size: headerTitleSize))
                .foregroundColor(Color("LoginTextDarkBackgroundColor"))
                .padding(.bottom, 10)
            
            Text("resetPasswordSubtitle")
                .font(.system(size: headerSubtitleSize))
                .foregroundColor(Color("LoginTextDarkBackgroundColor"))
        }
        .padding(.horizontal, 18)
        .padding(.bottom, 42)
    }
    
    var textFields: some View {
        StandardTextField(leadingIcon: "mail", textHint: "Enter your email", textInput: $email, inputType: .emailAddress, invalidAttempts: $emailAttempts)
            .padding(.bottom, 44)
    }
    
    var loginButton: some View {
        return SubmitButton(text: "reset", isEnabled: $buttonIsEnabled) {
            withAnimation(.easeInOut) {
                emailAttempts += 1
            }
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
