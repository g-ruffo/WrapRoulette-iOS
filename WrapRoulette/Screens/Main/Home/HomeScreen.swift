//
//  HomeScreen.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-03-22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: FirebaseAuthViewModel

    var body: some View {
        Button("Sign Out") {
            viewModel.signOut()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen()
        }
    }
}
