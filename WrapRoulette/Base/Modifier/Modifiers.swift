//
//  Modifiers.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-03-22.
//

import SwiftUI
import Combine


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
