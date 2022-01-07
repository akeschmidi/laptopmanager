//
//  ContentView.swift
//
//  Created by Stefan Schwinghammer on 27.10.21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Foundation


struct reservationView: View {
    
    @AppStorage("name") var name: String = ""
    @AppStorage("fach") var fach: String = ""
    @AppStorage("laptopID") var laptopID1 = ""
    @State  var date = Date()
    @State private var selectedLaptopID = ""
    
    
    //Count how many laptops you need for this view
    var laptopIDList = ["1", "2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    
    func addData(name:String, fach:String, laptopID:String){
        
        //Init Firebase/Firestor
        let db = Firestore.firestore()
        
        
        db.collection("reservation").addDocument(data: ["name": name, "fach": fach, "LaptopID": selectedLaptopID])
    
    }
    
    
    
    
    
    
    //View beginns
    var body: some View {
        List {
            TextField("Name", text: $name)
            TextField("Fach", text: $fach)
            Picker("Laptopnummer", selection: $selectedLaptopID) {
                    ForEach(laptopIDList, id: \.self) {
                        Text($0)
                        }
                    }
            DatePicker("Datum",selection: $date,displayedComponents: [.date])
                .datePickerStyle(.compact)

            
            
            //Save Button
            Button(action: {
                name = String(name)
                fach = String(fach)
                laptopID1 = String(laptopID1)
                
                //Add Data to Firebase
                addData(name: name, fach: fach, laptopID: selectedLaptopID)
                
                //Clear InputFields
                name = ""
                fach = ""
                selectedLaptopID = ""
                
            })
                    
             {
                 Text("Speichern").frame(maxWidth: 400)
                    .padding()
                    .foregroundColor(.white)}
            .background(.teal)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .navigationTitle("Laptop's")
            }
        }
    }


struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: reservationView(),
                    label: {
                        Label("💻", systemImage: "")
                    })

            }
            .font(.largeTitle)
            .navigationTitle("💻 Reservation")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
