//
//  TasksView.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 02.10.2024.
//

import SwiftData
import SwiftUI

struct TasksView: View {

    @Binding var currentDate: Date
    @Query private var tasks: [Task]

    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate

        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task> {
            $0.creatingDate >= startOfDate && $0.creatingDate < endOfDate
        }

        let sortDescriptor = [
            SortDescriptor(\Task.creatingDate, order: .reverse)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(tasks) { task in
                TaskRowView(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
    }
}

#Preview {
    ContentView()
}
