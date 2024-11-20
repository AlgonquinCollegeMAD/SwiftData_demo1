//
//  Task.swift
//  SwiftData_demo
//
//  Created by Vladimir Cezar on 2024.11.20.
//


import SwiftUI
import SwiftData

@Model
class Task {
    var title: String
    var isCompleted: Bool
    @Relationship(inverse: \Project.tasks) var project: Project?

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
