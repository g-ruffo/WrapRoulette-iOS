//
//  InputEditText.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI

private let textFieldFontSize: CGFloat = 14

struct InputEditText: View {
    @Binding var textInput: String
    @State private var isSecured: Bool = true
    
    var isPassword: Bool = false
    var textHint: String = "Email Address"
    var leadingIcon: String = "mail"
    
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack {
                HStack {
                    Spacer(minLength: 20)
                    HStack (alignment: .center,
                            spacing: 15) {
                        Image(systemName: leadingIcon)
                            .resizable()
                            .scaledToFit()
                        //                    .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color("BluePrimary"))
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                        if isPassword {
                            if isSecured {
                                SecureField(textHint, text: $textInput)
                            } else {
                                TextField(textHint, text: $textInput)
                            }
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(Color("BluePrimary"))
                            }
                            
                        } else {
                            TextField (textHint, text: $textInput)
                                .font(.system(size: textFieldFontSize))
                        }
                        
                    }
                            .padding([.top,.bottom], 2)
                            .padding(.horizontal, 5)
                            .background(Color("LoginInputLayoutBoxColor"), alignment: .center)
                            .cornerRadius(5)
                    Spacer(minLength: 20)
                }
                if isPassword {
                    Text("\(textInput.count)/24")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 20)
                        .font(.system(size: textFieldFontSize, weight: .bold))
                }
            }
        }
    }
}

struct InputEditText_Previews: PreviewProvider {
    @State static var text = "Password"
    static var previews: some View {
        VStack{
            InputEditText(textInput: $text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()
    }
}

