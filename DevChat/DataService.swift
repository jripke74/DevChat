//
//  DataService.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/29/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

let FIR_CHILD_USERS = "user"

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    
    private static let _instance = DataService()
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var userRef: DatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }
    
    var mainStorageRef: StorageReference {
        return Storage.storage().reference(forURL: "gs://devchat-b5b35.appspot.com")
    }
    
    var imagesStorageRef: StorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: StorageReference {
        return mainStorageRef.child("vieos")
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        mainRef.child("user").child(uid).child("profile").setValue(profile)
    }
}
