//
//  Task.swift
//  ToDoListFirebase
//
//  Created by Николаев Никита on 10.11.2020.
//  Copyright © 2020 Николаев Никита. All rights reserved.
//

import Foundation
import Firebase

struct Task {
    let title: String
    let userId: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    init (title: String, userId: String) {
        self.title = title
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userId = snapshotValue["userId"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return (["title": title, "userId": userId, "completed": completed])
    }
    
}
