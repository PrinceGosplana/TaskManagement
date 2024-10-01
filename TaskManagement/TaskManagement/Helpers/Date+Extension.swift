//
//  Date+Extension.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 30.09.2024.
//

import SwiftUI

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format

        return formatter.string(from: self)
    }

    /// Checking whether the Date is Today
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }

    /// Checking if the date is same hour
    var isSameHour: Bool {
        Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }

    /// Checking if the date is past hour
    var isPast: Bool {
        Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }

    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date)
        var week: [WeekDay] = []
        let weekForDate = calendar.dateInterval(of: .weekday, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else {
            return []
        }

        (0..<7).forEach { index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek) {
                week.append(.init(date: weekDay))
            }
        }

        return week
    }


    /// Creating next week based on the last current week's date
    func createNextWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self )
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else {
            return []
        }
        return fetchWeek(nextDate)
    }

    /// Creating previous week based on the first current week's date
    func createPreviousWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfFirstDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -7, to: startOfFirstDate) else {
            return []
        }
        return fetchWeek(previousDate)
    }

    struct WeekDay: Identifiable {
        let id = UUID()
        let date: Date
    }
}
