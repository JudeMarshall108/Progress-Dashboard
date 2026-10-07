//
//  Metric.swift
//  Progress Dashboard
//
//  Created by Jude Burdick on 10/6/26.
//

import Foundation

struct Metric {
    var name: String
    var currentAmount: Double
    var goalAmount: Double
    var weeklyMetricChange: Double
    var progress: Double {
        currentAmount / goalAmount
    }
    var isImproving: Bool {
        weeklyMetricChange > 0.0
    }
}
