//
//  FloatingActionButton.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import SwiftUI

private var expandableFABRotation: CGFloat = 120
private var disabledOpacity: Double = 0.6
private var disabledScale: Double = 0.8
private var shadowRadius: CGFloat = 6
let colorEnabledFab = Color("ColorEnabledFab")
let colorEnabledFabText = Color("ColorEnabledFabText")



struct ExpandableFloatingActionButton: View {
    @State var isEnabled = true
    @State var isExpanded = false

    var body: some View {
        ZStack {
            Button {
                print("Show Fab menu")
                isExpanded.toggle()
            } label: {
                Image(systemName: "plus")
                    .rotationEffect(.degrees(isExpanded ? expandableFABRotation : 0))
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
                    .animation(.easeInOut)
                
            }
            .padding(24)
            .background(colorEnabledFab)
            .mask(Circle())
            .shadow(color: isEnabled ? .black : .clear, radius: shadowRadius)
            .opacity(isEnabled ? 1.0 : disabledOpacity)
            .zIndex(10)
            .scaleEffect(isEnabled ? 1 : disabledScale)
                        .disabled(!isEnabled)
            .animation(.spring(response: 0.2, dampingFraction: 0.6, blendDuration: 0.2))

            
            FloatingActionButtonMenuItem(isEnabled: $isEnabled, isExpanded: $isExpanded, offsety: -90)
            FloatingActionButtonMenuItem(isEnabled: $isEnabled, isExpanded: $isExpanded, offsetX: -60, offsety: -60, delay: 0.2)

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

    var body: some View {
        Button {
            print("Show Fab menu item")

        } label: {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .bold))
        }
        .padding()
        .background(colorEnabledFab)
        .mask(Circle())
        .offset(x: isExpanded ? offsetX : 0, y: isExpanded ? offsety : 0)
        .scaleEffect(isExpanded ? 1 : 0)
        .opacity(isEnabled ? 1.0 : disabledOpacity)
        .disabled(!isEnabled)
        .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(delay))
    }
}

struct FloatingActionButton: View {
    @State var isEnabled = true
    var icon: String = "pencil"

    var body: some View {
        ZStack {
            Button {
                print("Fab Clicked")
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
            }
            .padding(24)
            .background(colorEnabledFab)
            .mask(Circle())
            .shadow(color: isEnabled ? .black : .clear, radius: shadowRadius)
            .opacity(isEnabled ? 1.0 : disabledOpacity)
            .zIndex(10)
            .scaleEffect(isEnabled ? 1 : disabledScale)
            .disabled(!isEnabled)
            .animation(.spring(response: 0.2, dampingFraction: 0.6, blendDuration: 0.2))
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
            ExpandableFloatingActionButton()
            Spacer()
            FloatingActionButton()
            Spacer()

        }
    }
}

