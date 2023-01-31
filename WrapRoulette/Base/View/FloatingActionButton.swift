//
//  FloatingActionButton.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import SwiftUI
private var expandableFABSize: CGFloat = 80
private var expandedFABItemSize: CGFloat = 55

struct ExpandableFloatingActionButton: View {
    @State var isEnabled = true
    @State var isExpanded = false
    
    var buttonColor: Color {
        isEnabled ? Color("ColorEnabledFab") : Color("ColorDisabledFab")
    }
    
    var textColor: Color {
        isEnabled ? Color("ColorEnabledFabText") : Color("ColorDisabledFabText")
    }
    
    var body: some View {
        ZStack {
            Button {
                print("Show Fab menu")
                isExpanded.toggle()
            } label: {
                Image(systemName: "plus")
                    .rotationEffect(.degrees(isExpanded ? 120 : 0))
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
                    .animation(.easeInOut)
                
            }
            .padding(24)
            .background(buttonColor)
            .mask(Circle())
            .shadow(color: .black, radius: 10)
            .zIndex(10)
            .disabled(!isEnabled)
            
            FloatingActionButtonMenuItem(isEnabled: $isEnabled, isExpanded: $isExpanded, offsety: -90)
            FloatingActionButtonMenuItem(isEnabled: $isEnabled, isExpanded: $isExpanded, offsetX: -60, offsety: -60, delay: 0.2)

        }
    }
}
    


struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableFloatingActionButton()
    }
}

struct FloatingActionButtonMenuItem: View {
    @Binding var isEnabled: Bool
    @Binding var isExpanded: Bool
    var icon: String = "pencil"
    var offsetX: CGFloat = 0
    var offsety: CGFloat = 0
    var delay = 0.0

    var buttonColor: Color {
        isEnabled ? Color("ColorEnabledFab") : Color("ColorDisabledFab")
    }
    
    var body: some View {
        Button {
            print("Show Fab menu item")

        } label: {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .bold))
        }
        .padding()
        .background(buttonColor)
        .mask(Circle())
        .offset(x: isExpanded ? offsetX : 0, y: isExpanded ? offsety : 0)
        .scaleEffect(isExpanded ? 1 : 0)
        .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(delay))
    }
}

