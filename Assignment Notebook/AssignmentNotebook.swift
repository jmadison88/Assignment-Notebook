//
//  AssignmentNotebook.swift
//  Assignment Notebook
//
//  Created by Josh Madison on 1/26/23.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignments : [Assignment] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(assignments) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let assignments = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Assignment].self, from: assignments) {
                self.assignments = decoded
                return
            }
        }
        assignments = []
    }
}
