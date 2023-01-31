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
    
    @State private var buttonIsEnabled: Bool = false
    @State private var email: String = ""
    @State private var password: String = ""

    
    var body: some View {
        VStack {
            Group{
                Spacer()
                Spacer()
                logoHeader
                Spacer()
            }
            
            Group{
                InputEditText(leadingIcon: "mail", textHint: "Enter your email", textInput: $email)
                InputEditText(leadingIcon: "lock.square", textHint: "Enter your password", textInput: $password, isPassword: true)
            }
                    
            Button {
            } label: {
                Text("Forgot password?")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.all, 20)
            
            Spacer()
            
            SubmitButton(text: "Login", isEnabled: $buttonIsEnabled) {
                print("login")
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
