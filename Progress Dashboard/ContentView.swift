//
//  ContentView.swift
//  Progress Dashboard
//
//  Created by Jude Burdick on 10/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = DashboardViewModel()
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                Text("Progress Dashboard").font(.system(size: 33)).bold().fontDesign(.monospaced).foregroundStyle(.white)
                tile()
                logButtons
            }
        }
    }
    
    private func tile() -> some View {
        ForEach(viewModel.metrics.indices, id: \.self) { index in
            let metric = viewModel.metrics[index]
            MetricTile (name: metric.name,
                        currentAmount: metric.currentAmount,
                        goalAmount: metric.goalAmount,
                        progress: metric.progress,
                        isImproving: metric.isImproving)
        }
    }
    
    private func logButton(title: String, index: Int, amount: Double) -> some View {
        Button(title) {
            viewModel.addProgress(at: index, amount: amount)
        }
        .buttonStyle(.borderedProminent)
        .tint(.white.opacity(0.3))
    }
    
    private var logButtons: some View {
        HStack(spacing: 8) {
            logButton(title: "+1 AI Project", index: 0, amount: 1)
            logButton(title: "+1 PTA Lesson", index: 1, amount: 1)
            logButton(title: "+1 Book", index: 2, amount: 1)
        }
        .padding(.top)
    }
    
}

#Preview {
    ContentView()
}
