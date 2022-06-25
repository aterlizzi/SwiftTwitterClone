//
//  SwiftTwitterCloneApp.swift
//  SwiftTwitterClone
//
//  Created by Aidan Terlizzi on 6/16/22.
//

import SwiftUI
import Firebase

@main
struct SwiftTwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
