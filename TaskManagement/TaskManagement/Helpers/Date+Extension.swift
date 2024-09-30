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
}
