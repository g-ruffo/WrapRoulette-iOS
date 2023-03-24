//
//  PasswordTextField.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI


struct PasswordTextField: View {
    
    var textHint: String = "Enter Password"
    @Binding var textInput: String
    @State private var isSecured: Bool = true
    @Binding var invalidAttempts: CGFloat
    
    private let leadingIcon: String = "lock.square"
    
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
                        
                        Group {
                            if isSecured { SecureField(textHint, text: $textInput) }
                            else { TextField(textHint, text: $textInput) }
                        }
                        .font(Font.system(size: textFieldFontSize))
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .modifier(TextLimit(value: $textInput, limit: 24))
                        .onChange(of: textInput, perform: { newValue in
                            if invalidAttempts != 0 { invalidAttempts = 0}
                        })
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(Color("BluePrimary"))
                        }
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
    @State static var text = "password"
    @State static var attempt: CGFloat = 1
    
    static var previews: some View {
        VStack {
            PasswordTextField(textInput: $text, invalidAttempts: $attempt)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BluePrimary"))
        .ignoresSafeArea()
    }
}
