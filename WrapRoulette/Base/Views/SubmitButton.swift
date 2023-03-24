//
//  UtilityViews.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import SwiftUI

private var buttonCornerRadius: CGFloat = 12
private var buttonPaddingHorizontal: CGFloat = 40

struct SubmitButton: View {
    var text: String = "Submit"
    @Binding var isEnabled: Bool
    
    var buttonColor: Color = Color("ButtonOrangeEnabled")
    var textColor: Color = Color("BluePrimary")
    
    var clicked: () -> Void
    
    var body: some View {
        HStack {
            Button(action: clicked) {
                Text(text)
                    .foregroundColor(.white)
                    .textCase(.uppercase)
                    .font(.system(size: buttonTextFontSize, weight: .bold))
                    .padding(.horizontal, buttonPaddingHorizontal)
                    .padding(.vertical, 12)
                
            }
            .disabled(!isEnabled)
            .background(buttonColor)
            .cornerRadius(buttonCornerRadius)
            .opacity(isEnabled ? 1.0 : disabledButtonOpacity)
            .scaleEffect(isEnabled ? 1 : disabledButtonScale)
            .animation(.spring(response: disabledButtonSpringAnimationResponse,
                               dampingFraction: disabledButtonSpringAnimationDamping, blendDuration: disabledButtonSpringAnimationDuration))
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    @State static var enabled = true
    static var previews: some View {
        VStack {
            SubmitButton(isEnabled: $enabled) {}
        }
    }
}

