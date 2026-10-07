//
//  ProgressCircleShape.swift
//  Progress Dashboard
//
//  Created by Jude Burdick on 10/6/26.
//

import SwiftUI

struct ProgressCircleShape: Shape {
    var progress: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: min(rect.width, rect.height) / 2 - 5,
            startAngle: .degrees(-90),
            endAngle: .degrees(-90 + 360 * progress),
            clockwise: false
        )
        return path
    }
}

#Preview {
    ProgressCircleShape(progress: 0.6)
        .stroke (
            .teal,
            style: StrokeStyle(lineWidth: 15, lineCap: .round)
        )
        .frame(width: 150, height: 150)
        .padding()
    
}
