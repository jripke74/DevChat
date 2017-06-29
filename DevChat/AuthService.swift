//
//  AuthService.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/28/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                //self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    // Sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            // Show error to user
                                        } else {
                                            // wwe have successfully logged in
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    // handle all other errors
                }
            } else {
                // Sucessfully logged in
            }
        })
    }
}
