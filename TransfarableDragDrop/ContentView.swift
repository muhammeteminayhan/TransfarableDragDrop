//
//  ContentView.swift
//  TransfarableDragDrop
//
//  Created by Muhammet Emin Ayhan on 7.10.2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @StateObject private var viewModel = SwiftUICodeViewModel()
    var body: some View {
        VStack {
            SwiftUICodesColumn (
                title: "To Do",
                tasks: viewModel.tasks.filter { $0.status == .toDo},
                isTargeted: $viewModel.isToDoTarget,
                onDrop: { droppedTasks in
                    viewModel.updateTasks(droppedTasks, to: .toDo)
                }
            )
            SwiftUICodesColumn (
                title: "In Progress",
                tasks: viewModel.tasks.filter { $0.status == .inProgress},
                isTargeted: $viewModel.isInProgressTarget,
                onDrop: { droppedTasks in
                    viewModel.updateTasks(droppedTasks, to: .inProgress)
                }
            )
            SwiftUICodesColumn (
                title: "Done",
                tasks: viewModel.tasks.filter { $0.status == .done},
                isTargeted: $viewModel.isDoneTarget,
                onDrop: { droppedTasks in
                    viewModel.updateTasks(droppedTasks, to: .done)
                }
            )
        }
    }
}
#Preview {
    ContentView()
}
