//
//  ProjectsListView.swift
//  SwiftData_demo
//
//  Created by Vladimir Cezar on 2024.11.20.
//

import SwiftUI
import SwiftData

struct ProjectsListView: View {
  @Query var projects: [Project]
  @Environment(\.modelContext) private var context
  
  @FocusState private var isFocused: Bool
  @State private var newProjectName: String = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        if projects.isEmpty {
          ContentUnavailableView {
            Label("No Projects.", systemImage: "list.dash")
          } description: {
            Text("No projects yet. Add one to get started.")
          }
        } else {
          List {
            ForEach(projects) { project in
              HStack {
                Text(project.name)
                Spacer()
              }
            }
            .onDelete(perform: deleteProjects)
          }
        }
        
        HStack {
          TextField("New Project", text: $newProjectName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focused($isFocused)
          Button("Add") {
            addProject(name: newProjectName)
            newProjectName = ""
          }
        }
        .padding()
      }
      .navigationTitle("Projects")
      .onAppear {
        isFocused = true
      }
    }
  }
  
  private func addProject(name: String) {
    guard !name.isEmpty else { return }
    let newProject = Project(name: name)
    context.insert(newProject)
    try? context.save()
  }
  
  private func deleteProjects(at offsets: IndexSet) {
    let projectsToDelete = offsets.map { projects[$0] }
    for project in projectsToDelete {
      context.delete(project)
    }
  }
}
