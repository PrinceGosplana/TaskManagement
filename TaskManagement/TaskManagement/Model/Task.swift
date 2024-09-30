//
//  Task.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 30.09.2024.
//

import SwiftUI

struct Task: Identifiable {
    let id: UUID = .init()
    let taskTitle: String
    var creatingDate: Date = .init()
    var isCompleted: Bool = false
    let tint: Color
}

extension Task {
    static var mock: [Task] = [
        .init(taskTitle: "Record Video", creatingDate: .updateHour(-5), isCompleted: true, tint: Color.taskColor1 ?? .clear),
        .init(taskTitle: "Redesign Website", creatingDate: .updateHour(-3), tint: Color.taskColor2 ?? .clear),
        .init(taskTitle: "Go for a walk", creatingDate: .updateHour(-4), tint: Color.taskColor3 ?? .clear),
        .init(taskTitle: "Edit video", creatingDate: .updateHour(0), isCompleted: true, tint: Color.taskColor4 ?? .clear),
        .init(taskTitle: "Publish video", creatingDate: .updateHour(2), isCompleted: true, tint: Color.taskColor5 ?? .clear),
        .init(taskTitle: "Tweet about new video", creatingDate: .updateHour(1), tint: Color.taskColor1 ?? .clear)
    ]
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
