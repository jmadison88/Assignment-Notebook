//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Josh Madison on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var assignment = ["First Assignment", "Second Assingment", "Third Assignment", "Fourth Assignment", "Fifth Assignment"]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignment, id: \.self) { thing in
                    Text(thing)
                }
                .onMove { indices, newOffset in
                    assignment.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignment.remove(atOffsets: indexSet)
                }
                .navigationBarTitle("Assignment", displayMode: .inline)
                .navigationBarItems(leading: EditButton())
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentNotebook: Identifiable, Codable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}

