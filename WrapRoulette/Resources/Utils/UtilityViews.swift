//
//  UtilityViews.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI
import Combine


struct ErrorShakeTextFieldEffect: GeometryEffect {
    var travelDistance: CGFloat = 6
    var shakeCount: CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: travelDistance * sin(animatableData * .pi * shakeCount), y: 0))
    }
}


struct TextLimit: ViewModifier {
    @Binding var value: String
    var limit: Int
    
    func body(content: Content) -> some View {
        return content
            .onReceive(Just(self.value)) { inputValue in
            if inputValue.count > limit {
                self.value.removeLast()
            }
        }
    }
}
