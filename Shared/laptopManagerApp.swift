//
//  laptopManagerApp.swift
//  Shared
//
//  Created by Stefan Schwinghammer on 27.10.21.
//

import SwiftUI
import Firebase

@main
struct laptopManagerApp: App {
    
    //Add Firebase
    init() {
      FirebaseApp.configure()
    }
    
    //Main View
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
