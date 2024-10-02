//
//  Task.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 30.09.2024.
//

import SwiftUI
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID
    var taskTitle: String
    var creatingDate: Date
    var isCompleted: Bool
    var tint: String

    init(id: UUID = .init(), taskTitle: String, creatingDate: Date = .init(), isCompleted: Bool = false, tint: String) {
        self.id = id
        self.taskTitle = taskTitle
        self.creatingDate = creatingDate
        self.isCompleted = isCompleted
        self.tint = tint
    }

    var tintColor: Color {
        switch tint {
        case "TaskColor1": Color.taskColor1 ?? .black
        case "TaskColor2": Color.taskColor2 ?? .black
        case "TaskColor3": Color.taskColor3 ?? .black
        case "TaskColor4": Color.taskColor4 ?? .black
        case "TaskColor5": Color.taskColor5 ?? .black
        default: .black
        }
    }
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
