//
//  PasswordTextField.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI

struct PasswordTextField: View {
    
    var leadingIcon: String = "lock.square"
    var textHint: String = "Enter Password"
    @Binding var textInput: String
    @State private var isSecured: Bool = true
    
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack {
                HStack {
                    Spacer(minLength: horizontalTextFieldSpacerWidth)
                    HStack (alignment: .center,
                            spacing: 15) {
                        Image(systemName: leadingIcon)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("BluePrimary"))
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                        if isSecured {
                            SecureField(textHint, text: $textInput)
                                .font(Font.system(size: textFieldFontSize, design: .default))
                                .padding(.vertical, 10)
                            
                            
                        } else {
                            TextField(textHint, text: $textInput)
                                .font(Font.system(size: textFieldFontSize, design: .default))
                                .padding(.vertical, 10)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
        
                        }
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(Color("BluePrimary"))
                        }
                    }
                            .padding([.top,.bottom], 2)
                            .padding(.horizontal, 15)
                            .background(Color("LoginInputLayoutBoxColor"), alignment: .center)
                            .cornerRadius(5)
                    Spacer(minLength: horizontalTextFieldSpacerWidth)
                }
                Text("\(textInput.count)/24")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
                    .font(.system(size: textFieldFontSize, weight: .bold))
            }
        }
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    @State static var text = "Password"

    static var previews: some View {
        VStack {
            PasswordTextField(textInput: $text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()
    }
}
