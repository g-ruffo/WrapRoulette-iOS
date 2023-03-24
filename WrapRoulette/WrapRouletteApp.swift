//
//  WrapRouletteApp.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct WrapRouletteApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    @StateObject var loginViewModel = LoginViewModel()

    var body: some Scene {
        let loginViewModel = LoginViewModel()

        WindowGroup {
            NavigationView {
                LoginScreen()
                    .environmentObject(loginViewModel)
                    
            }
        }
    }
}
