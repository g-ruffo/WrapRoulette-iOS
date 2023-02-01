//
//  InputEditText.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI

let textFieldFontSize: CGFloat = 16
let horizontalTextFieldSpacerWidth: CGFloat = 30

struct StandardTextField: View {
    
    var leadingIcon: String = "mail"
    var textHint: String = "Email Address"
    @Binding var textInput: String
    var inputType: UIKeyboardType = .default
    @Binding var invalidAttempts: CGFloat
    
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
                        
                        TextField (textHint, text: $textInput)
                            .font(Font.system(size: textFieldFontSize, design: .default))
                            .keyboardType(inputType)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .onChange(of: textInput, perform: { newValue in
                                if invalidAttempts != 0 { invalidAttempts = 0}
                            })
                        
                    }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(Color("LoginInputLayoutBoxColor"), alignment: .center)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(invalidAttempts == 0 ? .clear : .red)
                            )
                            .modifier(ErrorShakeTextFieldEffect(animatableData: CGFloat(invalidAttempts)))
                    Spacer(minLength: horizontalTextFieldSpacerWidth)
                }
            }
            .padding(.bottom, 8)
        }
    }
}

struct InputEditText_Previews: PreviewProvider {
    @State static var text = "Enter email"
    @State static var attempt: CGFloat = 1
    
    static var previews: some View {
        VStack{
            StandardTextField(textInput: $text, invalidAttempts: $attempt)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()
    }
}

