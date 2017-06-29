//
//  AuthService.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/28/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    DataService.instance.saveUser(uid: user!.uid)
                                    // Sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    // handle all other errors
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                // Sucessfully logged in
                onComplete?(nil, user)
            }
        })
    }
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch errorCode {
            case .invalidEmail:
                onComplete?("Invalid email address", nil)
            case .wrongPassword:
                onComplete?("Invalid password", nil)
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use.", nil)
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
            }
        }
    }
}
