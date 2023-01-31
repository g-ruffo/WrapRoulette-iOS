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
    @State var isEnabled = true
    
    var buttonColor: Color {
        isEnabled ? Color("ButtonOrangeEnabled") : Color("ButtonOrangeDisabled")
    }
    var clicked: () -> Void
    
    var body: some View {
        HStack {
            Button(action: clicked) {
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(Color("BluePrimary"))
                    .textCase(.uppercase)
                    .padding(.horizontal, buttonPaddingHorizontal)
                    .padding(.vertical)
                
            }
            .disabled(isEnabled)
            .background(buttonColor)
            .cornerRadius(buttonCornerRadius)
            .scaleEffect(isEnabled ? 1 : 0.8)
            .animation(.easeInOut)
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SubmitButton() {
                
            }
        }
    }
}

