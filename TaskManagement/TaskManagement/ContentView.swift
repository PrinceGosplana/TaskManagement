//
//  ContentView.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 30.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.BG ?? Color.primary)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
