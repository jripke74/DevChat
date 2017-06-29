//
//  User.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/29/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
}
