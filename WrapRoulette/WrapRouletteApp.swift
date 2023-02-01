//
//  WrapRouletteApp.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI
import Firebase

@main
struct WrapRouletteApp: App {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: loginViewModel)
        }
    }
}
