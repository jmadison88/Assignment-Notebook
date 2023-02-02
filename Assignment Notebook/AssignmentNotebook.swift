//
//  AssignmentNotebook.swift
//  Assignment Notebook
//
//  Created by Josh Madison on 1/26/23.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignments = [Assignment(priority: "High", description: "Take out trash", dueDate: Date()),
                                  Assignment(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                                  Assignment(priority: "Low", description: "Eat a donut", dueDate: Date())]
}
