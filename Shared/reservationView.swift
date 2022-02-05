//
//  reservationView.swift
//  laptopManager
//
//  Created by Stefan Schwinghammer on 08.01.22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Foundation


struct reservationView: View {
    
    
    @State public var firstname = ""
    @State public var lastname = ""
    
    @State public var selectedLaptopID = ""
    @State public var selectedFach = ""
    @State public var selectedTeacher = ""
    @State private var showingAlert = false
    @State var selectedDate = Date()
    @State var tab = false
    
    //Count how many laptops you need for this view
    var laptopIDList = ["1", "2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    var teacherList = ["André", "Anja", "Adriana", "Christian","Emanuela", "Clayton", "Denise", "Jolanda","Michaela","Kilian","Martina","Nadina","Petra","Silvan","Sandro","Stefan"]
    
    var fachList = ["Informatik", "Deutsch", "English", "PU","Französisch", "Anderes"]
    
    
    func addData(fistname:String, lastname:String, fach:String, laptopID:String, techaer:String, date:Date){
        
        signIn()
        
        //Init Firebase/Firestor
        let db = Firestore.firestore()
        

        
        // TODO:
        db.collection("reservation").addDocument(data: [
            "Firstname": fistname,
            "Lastname": lastname,
            "fach": selectedFach,
            "LaptopID": selectedLaptopID,
            "teacher": selectedTeacher,
            "Datum": selectedDate
            ])
    }
    
    
    
    //View beginns
    var body: some View {
        List {
                TextField("Schüler Vorname", text: $firstname)
                TextField("Schüler Nachname", text: $lastname)
                
                Picker("Laptopnummer", selection: $selectedLaptopID) {
                        ForEach(laptopIDList, id: \.self) {
                            Text($0)
                            }
                        }
                
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

                DatePicker("Datum",selection: $selectedDate,displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                Button("Fach und Lehrer Löschen") {
                    selectedFach = ""
                    selectedTeacher = ""
                }
                .buttonStyle(.bordered)

                Button(action: {
                                
                    //Add Data to Firebase
                    addData(fistname:firstname,
                            lastname: lastname,
                            fach: selectedFach,
                            laptopID: selectedLaptopID,
                            techaer: selectedTeacher,
                            date: selectedDate
                    )
                    
                    //Clear InputFields
                    firstname = ""
                    lastname = ""
                    selectedLaptopID = ""})
                    {
                         Text("Speichern").frame(maxWidth: 400)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 10)
                    }
                            .background(.teal)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .disabled(firstname.isEmpty||selectedFach.isEmpty||selectedTeacher.isEmpty||selectedLaptopID.isEmpty)
            }
        .navigationTitle("Erfassen")
        }
    }
struct reservationView_Previews: PreviewProvider {
    static var previews: some View {
        reservationView()
    }
}
