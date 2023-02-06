//
//  AddItemView.swift
//  Assignment Notebook
//
//  Created by Josh Madison on 2/2/23.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if description.count > 0 {
                    let item = Assignment(id: UUID(), description: description, dueDate: dueDate)
                    assignmentList.assignments.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(assignmentList: AssignmentList())
    }
}
