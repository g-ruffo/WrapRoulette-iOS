//
//  FloatingActionButton.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import SwiftUI

private var expandableFABRotation: CGFloat = 120
let disabledButtonOpacity: Double = 0.6
let disabledButtonScale: Double = 0.8
let shadowRadius: CGFloat = 6
let colorEnabledFab = Color("ColorEnabledFab")
let colorEnabledFabText = Color("ColorEnabledFabText")
let disabledButtonSpringAnimationResponse: Double = 0.2
let disabledButtonSpringAnimationDamping: Double = 0.6
let disabledButtonSpringAnimationDuration: Double = 0.2
let buttonIconFontSize: CGFloat = 38
let buttonTextFontSize: CGFloat = 18

struct ExpandableFloatingActionButton: View {
    @Binding var isEnabled: Bool
    @State var isExpanded = false
    
    var clicked: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: clicked) {
                Image(systemName: "plus")
                    .rotationEffect(.degrees(isExpanded ? expandableFABRotation : 0))
                    .foregroundColor(.white)
                    .font(.system(size: buttonIconFontSize, weight: .bold))
                    .animation(.easeInOut)
                
            }
            .padding(24)
            .background(colorEnabledFab)
            .mask(Circle())
            .shadow(color: isEnabled ? .black : .clear, radius: shadowRadius)
            .opacity(isEnabled ? 1.0 : disabledButtonOpacity)
            .zIndex(10)
            .scaleEffect(isEnabled ? 1 : disabledButtonScale)
            .disabled(!isEnabled)
            .animation(.spring(response: disabledButtonSpringAnimationResponse,
                               dampingFraction: disabledButtonSpringAnimationDamping, blendDuration: disabledButtonSpringAnimationDuration))
            
            
            FloatingActionButtonMenuItem(isEnabled: $isEnabled, isExpanded: $isExpanded, offsety: -90) {}
                .scaleEffect(isEnabled ? 1 : disabledButtonScale)

            FloatingActionButtonMenuItem(isEnabled: $isEnabled, isExpanded: $isExpanded, offsetX: -60, offsety: -60, delay: 0.2){}
                .scaleEffect(isEnabled ? 1 : disabledButtonScale)

            
        }
    }
}


struct FloatingActionButtonMenuItem: View {
    @Binding var isEnabled: Bool
    @Binding var isExpanded: Bool
    var icon: String = "pencil"
    var offsetX: CGFloat = 0
    var offsety: CGFloat = 0
    var delay = 0.0
    var clicked: () -> Void

    var body: some View {
        Button(action: clicked) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .bold))
        }
        .padding()
        .background(colorEnabledFab)
        .mask(Circle())
        .offset(x: isExpanded ? offsetX : 0, y: isExpanded ? offsety : 0)
        .scaleEffect(isExpanded ? 1 : 0)
        .opacity(isEnabled ? 1.0 : disabledButtonOpacity)
        .disabled(!isEnabled)
        .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(delay))
    }
}

struct FloatingActionButton: View {
    @Binding var isEnabled: Bool
    var icon: String = "pencil"
    
    var clicked: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: clicked) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: buttonIconFontSize, weight: .bold))
            }
            .padding(24)
            .background(colorEnabledFab)
            .mask(Circle())
            .shadow(color: isEnabled ? .black : .clear, radius: shadowRadius)
            .opacity(isEnabled ? 1.0 : disabledButtonOpacity)
            .zIndex(10)
            .scaleEffect(isEnabled ? 1 : disabledButtonScale)
            .disabled(!isEnabled)
            .animation(.spring(response: disabledButtonSpringAnimationResponse,
                               dampingFraction: disabledButtonSpringAnimationDamping, blendDuration: disabledButtonSpringAnimationDuration))
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    @State static var enabled = true
    static var previews: some View {
        HStack {
            Spacer()
            ExpandableFloatingActionButton(isEnabled: $enabled){ }
            Spacer()
            FloatingActionButton(isEnabled: $enabled) {}
            Spacer()
            
        }
    }
}

