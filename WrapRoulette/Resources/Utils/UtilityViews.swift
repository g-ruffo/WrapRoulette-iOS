//
//  UtilityViews.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import SwiftUI


struct ErrorShakeTextFieldEffect: GeometryEffect {
    var travelDistance: CGFloat = 6
    var shakeCount: CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: travelDistance * sin(animatableData * .pi * shakeCount), y: 0))
    }
}
