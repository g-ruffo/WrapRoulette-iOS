//
//  ContentView.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI

private var logoHorizontalPadding: CGFloat = 100.0
private var logoTextSize: CGFloat = 40

struct ContentView: View {
    
    @State private var buttonIsEnabled: Bool = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State var emailAttempts: CGFloat = 0
    @State var passwordAttempts: CGFloat = 0

    var body: some View {
        VStack {
            Group{
                Spacer()
                Spacer()
                logoHeader
                Spacer()
            }
            
            Group{
                StandardTextField(leadingIcon: "mail", textHint: "Enter your email", textInput: $email, inputType: .emailAddress, invalidAttempts: $emailAttempts)
                PasswordTextField(leadingIcon: "lock.square", textHint: "Enter your password", textInput: $password, invalidAttempts: $passwordAttempts)
            }
                    
            Button {
            } label: {
                Text("Forgot password?")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 30)
            .padding(.top, 4)

            
            Spacer()
            
            SubmitButton(text: "Login", isEnabled: $buttonIsEnabled) {
                withAnimation(.easeInOut) {
                    self.emailAttempts += 1
                    self.passwordAttempts += 1

                }
            }
            Spacer()

            Button {
            } label: {
                Text("clickToSignUp")
                    .foregroundColor(.white)
            }
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
                Spacer()
                Text("wrap")
                    .font(.custom("Ubuntu-Bold", size: logoTextSize))
                    .foregroundColor(.white)

                Text("roulette")
                    .font(.custom("Ubuntu-Light", size: logoTextSize))
                    .foregroundColor(.white)
                Spacer()

            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
