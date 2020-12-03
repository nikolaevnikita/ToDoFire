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
	private struct Constants {
		static let titleKey = "title"
		static let userIdKey = "userId"
		static let completedKey = "completed"
	}
	
    let title: String
    let userId: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    init (title: String, userId: String) {
        self.title = title
        self.userId = userId
        self.ref = nil
    }
    
    init?(snapshot: DataSnapshot) {
			guard let snapshotValue = snapshot.value as? [String: Any],
						let title = snapshotValue[Constants.titleKey] as? String,
						let userId = snapshotValue[Constants.userIdKey] as? String,
						let completed = snapshotValue[Constants.completedKey] as? Bool else { return nil }
			self.title = title
			self.userId = userId
			self.completed = completed
			ref = snapshot.ref
    }
    
	func convertToDictionary() -> [String: Any] {
        return [Constants.titleKey: title, Constants.userIdKey: userId, Constants.completedKey: completed]
    }
    
}
