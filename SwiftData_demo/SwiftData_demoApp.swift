//
//  SwiftData_demoApp.swift
//  SwiftData_demo
//
//  Created by Vladimir Cezar on 2024.11.20.
//

import SwiftUI

@main
struct SwiftData_demoApp: App {
  var body: some Scene {
    WindowGroup {
      ProjectsListView()
    }
    .modelContainer(for: [Project.self, Task.self])
  }
}
