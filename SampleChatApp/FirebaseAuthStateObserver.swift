//
//  FirebaseAuthStateObserver.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/19.
//

import Foundation
import FirebaseAuth
import FirebaseGoogleAuthUI

class FirebaseAuthStateObserver: ObservableObject {
    @Published var isSignin: Bool
    private var hundle: AuthStateDidChangeListenerHandle!
    
    init() {
        hundle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
              // User is signed in.
                self.isSignin = true
                self.getUserInfo()
            } else {
              // No user is signed in.
                self.isSignin = false
                self.getUserInfo()
            }// if else
        }// hundle
    }// init()
    
    deinit {
        Auth.auth().removeStateDidChangeListener(hundle)
    }
    func getUserInfo() {
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          let uid = user.uid
            print(uid)
          let email = user.email ?? "nomail"
            print(email)
            let photoURL = user.photoURL?.absoluteString
            print(photoURL ?? "noPhoto")
    }
    }
}

