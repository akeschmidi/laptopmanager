//
//  reporterView.swift
//  laptopManager
//
//  Created by Stefan Schwinghammer on 08.01.22.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct reporterView: View {
    
    //Values
    @State public var reporter = ""
    @State var report: String = ""
    @State var reportedDate = Date()
    @State public var reportedLaptopID = ""
    
    var laptopIDList = ["1", "2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    var teacherList = ["André", "Anja", "Adriana", "Christian","Emanuela", "Clayton", "Denise", "Jolanda","Michaela","Martina","Kilian","Nadina","Petra","Silvan","Sandro","Stefan"]
    
    
    func addData(reporter:String, report:String, reportedLaptopID:String, date:Date){
        
        //Init Firebase/Firestor
        let db = Firestore.firestore()
        
        db.collection("report").addDocument(data: [
            "LaptopID": reportedLaptopID,
            "reporter": reporter,
            "Datum": reportedDate,
            "Report": report
            ])
    
    }
    
    
    var body: some View {
        List {
            Picker("Laptopnummer", selection: $reportedLaptopID) {
                ForEach(laptopIDList, id: \.self) {
                    Text($0)
                }
            }
            Picker("Erfasser", selection: $reporter) {
                ForEach(teacherList, id: \.self) {
                    Text($0)
                }
            }
            DatePicker("Datum",selection: $reportedDate,displayedComponents: [.date])
                .datePickerStyle(.compact)
            
            TextField("Defekt eingeben:", text: $report)
            
            
            //Save Button
            Button(action: {
                
                //Add Data to Firebase
                addData(reporter: reporter, report: report, reportedLaptopID: reportedLaptopID, date: reportedDate)
                
                //Clear InputFields
                report = ""
                reporter = ""
                reportedLaptopID = ""
                
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
                        .disabled(report.isEmpty||reporter.isEmpty||reportedLaptopID.isEmpty)
        }
        


    }
}

struct reporterView_Previews: PreviewProvider {
    static var previews: some View {
        reporterView()
    }
}
