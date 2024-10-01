//
//  OffsetKey.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 01.10.2024.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
