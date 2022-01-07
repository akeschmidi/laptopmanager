//
//  ContentView.swift
//
//  Created by Stefan Schwinghammer on 27.10.21.
//

import SwiftUI




struct reservationView: View {
    
    @AppStorage("name") var name: String = "Anonymous Name"
    @AppStorage("fach") var fach: String = "Anonymous Fach"
    @AppStorage("laptopID") var laptopID1 = 1
    @State  var date = Date()
   
    @State private var selected = "1"
    
    var laptopIDList = ["1", "2", "3", "4"]
    
    
    var body: some View {
        List {
            TextField("Name", text: $name)
            TextField("Fach", text: $fach)
            Picker("Laptop", selection: $selected) {
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
                laptopID1 = Int(laptopID1)
                
                //Print
                print(name)
                print(fach)
                print(date)
                print(laptopID1)
            })
                    
             {
                    Text("Speichern").frame(maxWidth: 400)
                        .padding()
                        .foregroundColor(.white)
                }
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
            .navigationTitle("LMS 💻")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
