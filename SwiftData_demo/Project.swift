//
//  Project.swift
//  SwiftData_demo
//
//  Created by Vladimir Cezar on 2024.11.20.
//

import SwiftData

@Model
class Project {
    var name: String
    @Relationship var tasks: [Task] = []

    init(name: String) {
        self.name = name
    }
}
