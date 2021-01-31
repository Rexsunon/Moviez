//
//  ScreenShape.swift
//  Moviez
//
//  Created by Evidence Osikhena on 30/01/2021.
//

import SwiftUI

struct ScreenShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.origin.x + screenCurveture, y: rect.origin.y + screenCurveture))
            path.addQuadCurve(to: CGPoint(x: rect.width - screenCurveture, y: rect.origin.y + screenCurveture), control: CGPoint(x: rect.midX, y: rect.maxY + 50))
            
            if isClip {
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
                path.closeSubpath()
            }
        }
    }
    
    var screenCurveture: CGFloat = 30
    var isClip = false
}
