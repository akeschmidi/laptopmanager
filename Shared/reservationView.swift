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
    
    //Count how many laptops you need for this view
    var laptopIDList = ["1", "2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    var teacherList = ["André", "Anja", "Adriana", "Christian","Emanuela", "Clayton", "Denise", "Jolanda","Michaela","Kilian","Martina","Nadina","Petra","Silvan","Sandro","Stefan"]
    
    var fachList = ["Informatik", "Deutsch", "English", "PU","Französisch", "Anderes"]
    
    
    func addData(fistname:String, lastname:String, fach:String, laptopID:String, techaer:String, date:Date){
        
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
            TextField("Schueler Vorname", text: $firstname)
            TextField("Schueler Nachname", text: $lastname)
            
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
            DatePicker("Datum",selection: $selectedDate,displayedComponents: [.date])
                .datePickerStyle(.compact)
                
            
            // TODO: Dialog anzeigen
            
            
            // TODO: Überprüfung ob die felder nicht leer sind
            //Save Button
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
                selectedFach = ""
                selectedLaptopID = ""
                selectedTeacher = ""
                
                })
                {
                     Text("Speichern").frame(maxWidth: 400)
                        .padding(20)
                        .foregroundColor(.white)
                        .navigationBarHidden(true)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 10)
                }
                        .background(.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .disabled(firstname.isEmpty||selectedFach.isEmpty||selectedTeacher.isEmpty||selectedLaptopID.isEmpty)   
        }
        
    }
}
struct reservationView_Previews: PreviewProvider {
    static var previews: some View {
        reservationView()
    }
}
