//
//  LoginViewModel.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-31.
//

import Foundation
import FirebaseAuth


class LoginViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
        }
    }
}
