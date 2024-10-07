//
//  ViewModel.swift
//  TransfarableDragDrop
//
//  Created by Muhammet Emin Ayhan on 7.10.2024.
//

import SwiftUI

class SwiftUICodeViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Example1" ,status: .toDo),
        Task(title: "Example2" ,status: .toDo),
        Task(title: "Example3" ,status: .toDo)
    ]
    
    @Published var isToDoTarget: Bool = false
    @Published var isInProgressTarget: Bool = false
    @Published var isDoneTarget: Bool = false
    func updateTasks(_ droppedTasks: [Task], to status: TaskStatus) {
         for task in droppedTasks {
             if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                 tasks[index].status = status
             } else {
                 var newTask = task
                 newTask.status = status
                 tasks.append(newTask)
             }
        }
    }
}
