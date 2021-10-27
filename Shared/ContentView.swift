//
//  ContentView.swift
//  Shared
//
//  Created by Stefan Schwinghammer on 27.10.21.
//

import SwiftUI


struct Laptop10View: View {
    
    @State private var selectedColorIndex = 0
    var body: some View {
        List {
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            TextField("Fach", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            Picker(selection: $selectedColorIndex, label: Text("Nummer")) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("6").tag(6)
                Text("7").tag(7)
                Text("8").tag(8)
                Text("9").tag(9)
                Text("10").tag(10)
            }
            
            Button(action: {
                        print("Button Tapped")
                    })
                    {
                        Text("Speichern").frame(maxWidth: 400)
                            .padding()
                            .foregroundColor(.white)
                    }.background(.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            

        .navigationTitle("Laptop 1-10")
        }
    }
}


struct Laptop20View: View {
    
    @State private var selectedColorIndex = 0
    var body: some View {
        List {
            DatePicker(selection: .constant(Date()), label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            TextField("Fach", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            Picker(selection: $selectedColorIndex, label: Text("Nummer")) {
                Text("11").tag(11)
                Text("12").tag(12)
                Text("13").tag(13)
                Text("14").tag(14)
                Text("15").tag(15)
                Text("16").tag(16)
                Text("17").tag(17)
                Text("18").tag(18)
                Text("19").tag(19)
                Text("20").tag(20)
            }
            
            Button(action: {
                        print("Button Tapped")
                    })
                    {
                        Text("Speichern").frame(maxWidth: 400)
                            .padding()
                            .foregroundColor(.white)
                    }.background(.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            

        .navigationTitle("Laptop 11-20")
        }
    }
}


struct Laptop30View: View {
    
    @State private var selectedColorIndex = 0
    var body: some View {
        List {
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            TextField("Fach", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            Picker(selection: $selectedColorIndex, label: Text("Nummer")) {
                Text("21").tag(21)
                Text("22").tag(22)
                Text("23").tag(23)
                Text("24").tag(24)
                Text("25").tag(25)
                Text("26").tag(26)
                Text("27").tag(27)
                Text("28").tag(28)
                Text("29").tag(29)
                Text("30").tag(30)
            }
            
            Button(action: {
                        print("Button Tapped")
                    })
                    {
                        Text("Speichern").frame(maxWidth: 400)
                            .padding()
                            .foregroundColor(.white)
                    }.background(.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            

        .navigationTitle("Laptop 21-30")
        }
    }
}

struct Laptop40View: View {
    
    @State private var selectedColorIndex = 0
    var body: some View {
        List {
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            TextField("Fach", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            Picker(selection: $selectedColorIndex, label: Text("Nummer")) {
                Text("31").tag(31)
                Text("32").tag(32)
                Text("33").tag(33)
                Text("34").tag(34)
                Text("35").tag(35)
                Text("36").tag(36)
                Text("37").tag(37)
                Text("38").tag(38)
                Text("39").tag(39)
                Text("40").tag(40)
            }
            
            Button(action: {
                        print("Button Tapped")
                    })
                    {
                        Text("Speichern")
                            .padding()
                            .foregroundColor(.white)
                    }.background(.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
        .navigationTitle("Laptop 31-40")
        }
    }
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Laptop10View(),
                    label: {
                        Label("💻 1-10", systemImage: "")
                    })
                
                NavigationLink(
                    destination: Laptop20View(),
                    label: {
                        Label("💻 11-20", systemImage: "")
                    })
                
                NavigationLink(
                    destination: Laptop30View(),
                    label: {
                        Label("💻 21-30", systemImage: "")
                    })
                
                NavigationLink(
                    destination: Laptop40View(),
                    label: {
                        Label("💻 31-40", systemImage: "")
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
