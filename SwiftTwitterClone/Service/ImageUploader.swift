//
//  ImageUploader.swift
//  SwiftTwitterClone
//
//  Created by Aidan Terlizzi on 6/18/22.
//

import FirebaseStorage
import SwiftUI
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            }
            
            ref.downloadURL { imageUrl, error in
                if let error = error {
                    print("DEBUG: Failed to download image with error: \(error.localizedDescription)")
                }
                guard let imageUrl = imageUrl?.absoluteString else {
                    return
                }
                completion(imageUrl)
            }
            
        }
    }
}
