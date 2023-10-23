//
//  ContentView.swift
//  ToDoOOP
//
//  Created by Hakan Kaya on 17.10.2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var todoData = TodoData()
    @State var newEntry = ""
    @State var addButtonClicked = false
    @FocusState var getFocus: Bool
    
    init() {
        getFocus = false
    }
    
    var body: some View {
        Form {
            Section(header: Text("To Do").font(.largeTitle).bold()) {
                HStack {
                    Spacer()
                    Button {
                        addButtonClicked.toggle()
                        getFocus.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            Section(header: Text("List")) {
                todoData.showEntries()

                if addButtonClicked {
                    TextField("", text: $newEntry)
                        .focused($getFocus)
                        .onSubmit {
                            if newEntry == "" {
                                //dismis textedit
                            }
                            todoData.addEntry(newEntry)
                            newEntry = ""
                            addButtonClicked.toggle()
                            getFocus.toggle()
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
