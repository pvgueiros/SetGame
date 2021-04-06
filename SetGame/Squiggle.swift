//
//  Squiggle.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 06/04/21.
//

import SwiftUI

struct Squiggle: Shape {
        
    // MARK: - Required Shape Methods
    
    func path(in rect : CGRect) -> Path { // rect is the space offered for drawing
        
        let leftArcStart = CGPoint (x: rect.minX + rect.height/4, y: rect.maxY)
        let leftArcStop = CGPoint (x: rect.minX + 3 * rect.height/4, y: rect.minY)
        let rightArcStart = CGPoint (x: rect.maxX - rect.height/4, y: rect.minY)
        let rightArcStop = CGPoint (x: rect.maxX - 3 * rect.height/4, y: rect.maxY)
        
        var p = Path()
        p.move(to:leftArcStart)
        p.addCurve(to: leftArcStop, control1: CGPoint(x: rect.minX, y: rect.maxY), control2: CGPoint(x: rect.minX, y: rect.minY))
        p.addCurve(to: rightArcStart, control1: CGPoint(x: rect.midX + rect.height/4, y: rect.minY), control2: CGPoint(x: rect.midX+rect.height/4, y: rect.midY))
        p.addCurve(to: rightArcStop, control1: CGPoint(x: rect.maxX, y: rect.minY), control2: CGPoint(x: rect.maxX, y: rect.maxY))
        p.addCurve(to: leftArcStart, control1: CGPoint(x: rect.midX-rect.height/2, y: rect.midY), control2: CGPoint(x: rect.midX-rect.height/2, y: rect.maxY))

        return p
    }
}
