//
//  UserService.swift
//  SwiftTwitterClone
//
//  Created by Aidan Terlizzi on 6/18/22.
//

import Firebase
import FirebaseFirestore



struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
            }
    }
}
