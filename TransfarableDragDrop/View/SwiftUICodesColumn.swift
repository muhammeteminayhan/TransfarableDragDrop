//
//  SwiftUICodesColumn.swift
//  TransfarableDragDrop
//
//  Created by Muhammet Emin Ayhan on 7.10.2024.
//

import SwiftUI

struct SwiftUICodesColumn: View {
    let title: String
    let tasks: [Task]
    @Binding var isTargeted: Bool
    let onDrop: ([Task]) -> Void
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote.bold())
                .padding(.bottom, 5)
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isTargeted ? Color.teal.opacity(0.15) : Color(.secondarySystemFill))
                    .frame(maxWidth: .infinity)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks) { task in
                        Text(task.title)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
            .dropDestination(for: Task.self) { droppedTasks, _ in
                onDrop(droppedTasks)
                return true
            } isTargeted: { isOver in
                isTargeted = isOver
            }
        }
        .padding()
    }
}
