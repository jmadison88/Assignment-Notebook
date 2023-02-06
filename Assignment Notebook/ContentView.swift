//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Josh Madison on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.assignments) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentList.assignments.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentList.assignments.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignments To Do", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                showingAddItemView = true}) {
                    Image(systemName: "plus")
            })
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
    var description = String()
    var dueDate = Date()
}
