//
//  adminView.swift
//  laptopManager
//
//  Created by Stefan Schwinghammer on 08.01.22.
//

import SwiftUI
import FirebaseFirestore
import Firebase


struct User: Identifiable {
    var id: String = UUID().uuidString
    var Lastname: String
    var Firstname: String
    var LaptopID: String
    var Fach: String
}

class userViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("reservation").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let firstname = data["Firstname"] as? String ?? ""
                let lastname = data["Lastname"] as? String ?? ""
                let laptopID = data["LaptopID"] as? String ?? ""
                let fach = data["Fach"] as? String ?? ""

                
                return User(Lastname:lastname, Firstname:firstname, LaptopID:laptopID, Fach:fach)
            }
        }
    }
}


struct adminView: View {
    @ObservedObject private var viewModel = userViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.Firstname).font(.title)
                    Text(user.Lastname).font(.subheadline)
                }
            }.navigationBarTitle("Users")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}


struct adminView_Previews: PreviewProvider {
    static var previews: some View {
        adminView()
    }
}
