//
//  laptopManagerApp.swift
//  Shared
//
//  Created by Stefan Schwinghammer on 27.10.21.
//

import SwiftUI
import Firebase
import SwiftfulLoadingIndicators

@main
struct laptopManagerApp: App {
    
    //Add Firebase
    init() {
        FirebaseApp.configure()
        UITableViewCell.appearance().backgroundColor = .gray
    }
    
    //Main View
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
