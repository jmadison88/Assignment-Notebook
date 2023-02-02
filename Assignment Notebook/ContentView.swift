//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Josh Madison on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentsToDo = AssignmentList()
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentsToDo.assignments) { item in
                    VStack(alignment: .leading) {
                        Text(item.priority)
                            .font(.headline)
                        Text(item.description)
                    }
                    Spacer()
                    Text(item.dueDate, style: .date)
                }
                .onMove { indices, newOffset in
                    assignmentsToDo.assignments.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentsToDo.assignments.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("To Do List")
            .navigationBarItems(leading: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Assignment: Identifiable, Codable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
