//
//  TodoData.swift
//  ToDoOOP
//
//  Created by Hakan Kaya on 17.10.2023.
//
import SwiftUI

class TodoData: ObservableObject {
    @Published var liste: [String] = []
    
    func addEntry(_ newEntry: String) {
        liste.append(newEntry)
    }
    
    func showEntries() -> some View {
        List {
            ForEach(liste, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: { indexSet in
                self.liste.remove(atOffsets: indexSet)
            })
        }
    }
}
