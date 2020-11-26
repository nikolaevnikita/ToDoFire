//
//  User.swift
//  ToDoListFirebase
//
//  Created by Николаев Никита on 10.11.2020.
//  Copyright © 2020 Николаев Никита. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
