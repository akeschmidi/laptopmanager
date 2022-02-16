//
//  reporterView.swift
//  laptopManager
//
//  Created by Stefan Schwinghammer on 08.01.22.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth
import SimpleToast

struct reporterView: View {

    
    
    
    //Values
    @State public var reporter = ""
    @State public var report = ""
    @State var reportedDate = Date()
    @State public var reportedLaptopID = ""
    @State var buttonTap = false
    @State var showToast: Bool = false
    
    private let toastOptions = SimpleToastOptions(
        hideAfter: 2
    )
    
    var laptopIDList = ["1", "2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    var teacherList = ["André", "Anja", "Adriana", "Christian","Emanuela", "Clayton", "Denise", "Jolanda","Michaela","Martina","Kilian","Nadina","Petra","Silvan","Sandro","Stefan"]
    
    func signIn() {
      if Auth.auth().currentUser == nil {
        Auth.auth().signInAnonymously()
          print("Error SingIn")
      }
    }
    
    func addData(reporter:String, report:String, reportedLaptopID:String, date:Date){
        
        signIn()
        
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
                    withAnimation {
                        showToast.toggle()
                    }
                    })
                    {
                         Text("Speichern").frame(maxWidth: 400)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 10)
                        
                    }
            
                            .background(.teal)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .disabled(report.isEmpty||reporter.isEmpty||reportedLaptopID.isEmpty)

            }
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            HStack {
                Image(systemName: "heart.circle.fill")
                Text("Perfekt🎉, Daten gespeichert")
            }
            .padding()
            .background(Color.green.opacity(0.8))
            .foregroundColor(Color.white)
            .cornerRadius(10)
        }
        .navigationBarTitle("Defekt erfassen:")
        }
    }

struct reporterView_Previews: PreviewProvider {
    static var previews: some View {
        reporterView()
    }
}
