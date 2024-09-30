//
//  Home.swift
//  TaskManagement
//
//  Created by Oleksandr Isaiev on 30.09.2024.
//

import SwiftUI

struct Home: View {
    
    @State private var currentDate: Date = .init()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
        }
        .vSpacing(.top)
    }

    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMM"))
                    .foregroundStyle(.darkBlue ?? .blue)

                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())

            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing) {
            Button {

            } label: {
                Image(.prof)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)
            }
        }
        .padding(15)
        .background(.white)
    }
}

#Preview {
    ContentView()
}
