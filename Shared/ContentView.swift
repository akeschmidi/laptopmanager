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
    
    @AppStorage("Vorname") var fistname: String = ""
    @AppStorage("Nachname") var lastname: String = ""
    
    @State private var selectedLaptopID = ""
    @State private var selectedFach = ""
    @State private var selectedTeacher = ""
    
    
    @State  var date = Date()
    
    //Count how many laptops you need for this view
    var laptopIDList = ["1", "2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    var teacherList = ["Stefan", "Diveres"]
    
    var fachList = ["Informatik", "Deutsch", "Diverses"]
    
    
    func addData(fistname:String, lastname:String, fach:String, laptopID:String, techaer:String){
        
        //Init Firebase/Firestor
        let db = Firestore.firestore()
        
        
        db.collection("reservation").addDocument(data: ["Firstname": fistname, "Lastname": lastname, "fach": selectedFach, "LaptopID": selectedLaptopID, "teacher": selectedTeacher])
    
    }
    
    
    
    
    
    
    //View beginns
    var body: some View {
        List {
            TextField("Name", text: $fistname)
            TextField("Nachname", text: $lastname)
            
            Picker("Fach", selection: $selectedFach) {
                    ForEach(fachList, id: \.self) {
                        Text($0)
                        }
                    }
            Picker("Lehrperson", selection: $selectedTeacher ) {
                    ForEach(teacherList, id: \.self) {
                        Text($0)
                        }
                    }
            Picker("Laptopnummer", selection: $selectedLaptopID) {
                    ForEach(laptopIDList, id: \.self) {
                        Text($0)
                        }
                    }
            DatePicker("Datum",selection: $date,displayedComponents: [.date])
                .datePickerStyle(.compact)

            
            
            //Save Button
            Button(action: {
                
                //Add Data to Firebase
                addData(fistname: fistname,lastname: lastname, fach: selectedFach, laptopID: selectedLaptopID, techaer: selectedTeacher)
                
                //Clear InputFields
                fistname = ""
                lastname = ""
                selectedFach = ""
                selectedLaptopID = ""
                selectedTeacher = ""
                
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
