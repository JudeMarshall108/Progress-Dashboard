//
//  DashboardViewModel.swift
//  Progress Dashboard
//
//  Created by Jude Burdick on 10/6/26.
//

import Observation

@Observable
class DashboardViewModel {
    private(set) var metrics: [Metric] = [
        Metric(name: "AI Training", currentAmount: 3, goalAmount: 6, weeklyMetricChange: -1),
        Metric(name: "PTA Certification", currentAmount: 5, goalAmount: 20, weeklyMetricChange: 1),
        Metric(name: "Bible Reading", currentAmount: 66, goalAmount: 66, weeklyMetricChange: 1)
    ]
    
    func addProgress(at index: Int, amount: Double) {
        guard metrics.indices.contains(index) else { return }
        metrics[index].currentAmount = min(
            metrics[index].currentAmount + amount, metrics[index].goalAmount
        )
    }
}
