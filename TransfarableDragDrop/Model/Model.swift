//
//  Model.swift
//  TransfarableDragDrop
//
//  Created by Muhammet Emin Ayhan on 7.10.2024.
//

import SwiftUI
struct Task: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var status: TaskStatus
    init(id: UUID = UUID(), title: String, status: TaskStatus) {
        self.id = id
        self.title = title
        self.status = status
    }
}

enum TaskStatus: String, Codable, Hashable {
    case toDo
    case inProgress
    case done
}
