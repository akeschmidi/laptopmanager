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


struct Report: Identifiable {
    var id: String = UUID().uuidString
    var report: String
    var reporter: String
    var LaptopID: String
}

func signIn() {
  if Auth.auth().currentUser == nil {
    Auth.auth().signInAnonymously()
      print("Error SingIn")
  }
}


class userViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var report = [Report]()
    
    private var db = Firestore.firestore()
    
    func fetchDataReservations() {
        signIn()
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
                let fach = data["fach"] as? String ?? ""

                
                return User(Lastname:lastname, Firstname:firstname, LaptopID:laptopID, Fach:fach)
            }
        }
    }
    
    func fetchDataReports() {
        db.collection("report").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.report = documents.map { (queryDocumentSnapshot) -> Report in
                let data = queryDocumentSnapshot.data()
                let laptopID = data["LaptopID"] as? String ?? ""
                let report = data["Report"] as? String ?? ""
                let reporter = data["Reporter"] as? String ?? ""

                
                return Report(report:report, reporter:reporter,LaptopID:laptopID)
            }
        }
    }
}


struct adminView: View {
    @ObservedObject private var viewModel = userViewModel()
    
    var body: some View {
        
        Group {
            List(viewModel.users) { user in
                HStack {
                    Text("Vorname: " + user.Firstname)
                    Text("Nachname: " + user.Lastname)
                    Text("Laptopnummer: " + user.LaptopID)
                    Text("Fach: " + user.Fach)
                }
            }
            .listStyle(.grouped)
            .onAppear() {
                self.viewModel.fetchDataReservations()
            }
            
            List(viewModel.report) { report in
                HStack {
                    Text("Laptopnummer: " + report.LaptopID)
                    Text("Bericht: " + report.report)
                    Text("Melder: " + report.reporter)
                }
            }
            .onAppear() {
                self.viewModel.fetchDataReports()
            }
            .listStyle(.grouped)
        }
    }
}


struct adminView_Previews: PreviewProvider {
    static var previews: some View {
        adminView()
    }
}
