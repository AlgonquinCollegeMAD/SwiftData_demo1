//
//  TasksListView.swift
//  SwiftData_demo
//
//  Created by Vladimir Cezar on 2024.11.20.
//

import SwiftUI
import SwiftData

struct TasksListView: View {
  @Query var tasks: [Task]
  @Environment(\.modelContext) private var context
  
  @FocusState private var isFocused: Bool
  @State private var newTaskTitle: String = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        if tasks.isEmpty {
          ContentUnavailableView {
            Label("No Tasks.", systemImage: "list.dash")
          } description: {
            Text("No tasks available. Either you are a very free person or you don't know how to use this app...")
          }
        } else {
          List {
            ForEach(tasks) { task in
              HStack {
                Text(task.title)
                Spacer()
                if task.isCompleted {
                  Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                }
              }
            }
            .onDelete(perform: deleteTasks)
          }
        }
        
        HStack {
          TextField("New Task", text: $newTaskTitle)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focused($isFocused)
          Button("Add") {
            addTask(title: newTaskTitle)
            newTaskTitle = ""
          }
        }
        .padding()
      }
      .navigationTitle("Tasks")
      .onAppear {
        isFocused = true
      }
    }
  }
  
  private func addTask(title: String) {
    guard !title.isEmpty else { return }
    let newTask = Task(title: title)
    context.insert(newTask)
    try? context.save()
  }
  
  private func deleteTasks(at offsets: IndexSet) {
    let tasksToDelete = offsets.map { tasks[$0] }
    for task in tasksToDelete {
      context.delete(task)
    }
  }
}
