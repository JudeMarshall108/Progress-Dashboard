//
//  TrendArrowShape.swift
//  Progress Dashboard
//
//  Created by Jude Burdick on 10/6/26.
//

import SwiftUI

struct TrendArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    TrendArrowShape()
        .fill(.green)
        .frame(width: 20, height: 17.5)
        .padding()
}
