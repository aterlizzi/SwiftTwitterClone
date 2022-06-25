//
//  User.swift
//  SwiftTwitterClone
//
//  Created by Aidan Terlizzi on 6/18/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
