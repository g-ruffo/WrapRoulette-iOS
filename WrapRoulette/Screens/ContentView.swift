//
//  ContentView.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: FirebaseAuthViewModel
    
    var body: some View {
        Group {
                    if viewModel.user != nil {
                        HomeScreen()
                    } else {
                        LoginScreen()
                    }
                }.onAppear {
                    viewModel.listenToAuthState()
                }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FirebaseAuthViewModel())
    }
}
