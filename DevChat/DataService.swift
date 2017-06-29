//
//  DataService.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/29/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    
    private static let _instance = DataService()
    static var instance: DataService {
        return _instance
    }
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        mainRef.child("user").child(uid).child("profile").setValue(profile)
    }
}
