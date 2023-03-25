//
//  SwiftUIView.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-03-22.
//

import SwiftUI

var logoHorizontalPadding: CGFloat = 100.0
var logoTextSize: CGFloat = 40

struct LoginScreen: View {
    
    @EnvironmentObject var viewModel: FirebaseAuthViewModel

    @State private var showSignup = false
    @State private var showResetPassword = false
    @State private var buttonIsEnabled: Bool = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State var emailAttempts: CGFloat = 0
    @State var passwordAttempts: CGFloat = 0

    var body: some View {
        VStack {
            Group {
                Spacer()
                Spacer()
                Spacer()
                logoHeader
                Spacer()
                Spacer()
            }
            textFields
            forgotPassword
            Spacer()
            loginButton
            Spacer()
            signupButton
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()

    }
    
    var logoHeader: some View {
        VStack {
                Image("LogoWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 120)
                    .padding(.horizontal, logoHorizontalPadding)
            HStack{
                Text("wrap")
                    .font(.custom("Ubuntu-Bold", size: logoTextSize))
                    .foregroundColor(.white)

                Text("roulette")
                    .font(.custom("Ubuntu-Light", size: logoTextSize))
                    .foregroundColor(.white)
            }
        }
    }
    var textFields: some View {
        VStack {
            EmailTextField(textInput: $email, inputType: .emailAddress, invalidAttempts: $emailAttempts)
            
            PasswordTextField(textHint: "Enter your password", textInput: $password, invalidAttempts: $passwordAttempts)
        }
    }
    var forgotPassword: some View {
        NavigationLink(destination: ResetPasswordScreen()) {
                Text("Forgot password?")
                    .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, horizontalTextFieldSpacerWidth)
        .padding(.top, 4)
    }
    var loginButton: some View {
        return SubmitButton(text: "signIn", isEnabled: $buttonIsEnabled) {
            
            guard !email.isEmpty, !password.isEmpty else {
                return
            }
                    
            viewModel.signIn(email: email, password: password)
            withAnimation(.easeInOut) {
                emailAttempts += 1
                passwordAttempts += 1
            }
        }
    }
    var signupButton: some View {
        NavigationLink(destination: ResetPasswordScreen()) {
                Text("clickToSignUp")
                    .foregroundColor(.white)
            
        }
    }

}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
//        LoginScreen(viewModel: LoginViewModel())
        LoginScreen()
    }
}
