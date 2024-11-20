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
    var id: UUID
    var title: String
    var isCompleted: Bool

    init(title: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
    }
}