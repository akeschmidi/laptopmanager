//
//  ContentView.swift
//
//  Created by Stefan Schwinghammer on 27.10.21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Foundation

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: reservationView(),
                    label: {
                        Label("Erfassung", systemImage: "person.fill.checkmark")
                    })
                    
                NavigationLink(
                    destination: adminView(),
                    label: {
                        Label("Admin", systemImage: "person.2.fill")
                    })
                
                NavigationLink(
                    destination: reporterView(),
                    label: {
                        Label("Defekt erfassen", systemImage: "pencil")
                    })

            }
            .navigationTitle("Home 💻")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
