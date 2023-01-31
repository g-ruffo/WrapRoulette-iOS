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
                                .padding(.vertical, 10)

                    }
                            .padding([.top,.bottom], 2)
                            .padding(.horizontal, 15)
                            .background(Color("LoginInputLayoutBoxColor"), alignment: .center)
                            .cornerRadius(5)
                    Spacer(minLength: horizontalTextFieldSpacerWidth)
                }
            }
            .padding(.bottom, 8)
        }
    }
}

struct InputEditText_Previews: PreviewProvider {
    @State static var text = "Password"
    static var previews: some View {
        VStack{
            StandardTextField(textInput: $text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()
    }
}

