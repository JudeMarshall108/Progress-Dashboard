//
//  MetricTile.swift
//  Progress Dashboard
//
//  Created by Jude Burdick on 10/6/26.
//

import SwiftUI

struct MetricTile: View {
    let name: String
    let currentAmount: Double
    let goalAmount: Double
    let progress: Double
    let isImproving: Bool
    
    var body: some View {
        ZStack {
            rectangle()
            VStack(spacing: 10) {
                Text(name).font(.system(size: 20)).fontDesign(.monospaced).bold()
                ring()
                amountText()
                status()
            }
        }
    }
    
    private func rectangle() -> some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 220, height: 200)
            .foregroundStyle(.white)
            .shadow(radius: 5)
    }
    
    private func ring() -> some View {
        ZStack {
            ProgressCircleShape(progress: 1)
                .stroke(.gray.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round))
            ProgressCircleShape(progress: progress)
                .stroke(progress >= 1 ? Color.green : Color.teal, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            Text("\(Int(progress * 100))%").fontDesign(.monospaced).underline()
        }
        .frame(width: 100, height: 100)
    }
    
    private func amountText() -> some View {
        Text("\(currentAmount, specifier: "%.0f") of \(goalAmount, specifier: "%.0f")")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
    
    private func trendArrow() -> some View {
        TrendArrowShape()
            .fill(isImproving ? Color.green : Color.red)
            .rotationEffect(isImproving ? .degrees(0) : .degrees(180))
            .frame(width: 20, height: 16)
    }
    
    private func status() -> some View {
        HStack(spacing: 3) {
            if progress >= 1 {
                Text("You did it! 🥳")
                    .foregroundStyle(.green)
            } else {
                trendArrow()
                Text(isImproving ? "Up this week!" : "Down this week!")
            }
        }
        .font(.system(size: 12)).fontDesign(.monospaced)
    }
}

#Preview {
    MetricTile(
        name: "Workouts",
        currentAmount: 5,
        goalAmount: 5,
        progress: 1.0,
        isImproving: true
    )
}
