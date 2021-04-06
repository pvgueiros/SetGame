//
//  Oval.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 06/04/21.
//

import SwiftUI

struct Oval: Shape {

    // MARK: - Required Shape Methods
    
    func path(in rect: CGRect) -> Path {
        let radius: CGFloat = rect.height/2

        let topLineRight = CGPoint(x: rect.maxX - radius, y: rect.maxY)
        let bottomLineLeft = CGPoint(x: rect.minX + radius, y: rect.minY)

        let rightArcCenter = CGPoint(x: rect.maxX - radius, y: rect.midY)
        let leftArcCenter = CGPoint(x: rect.minX + radius, y: rect.midY)

        var p = Path()
        p.addArc(center: rightArcCenter, radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: -90), clockwise: true)
        p.addLine(to: bottomLineLeft)
        p.addArc(center: leftArcCenter, radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90), clockwise: true)
        p.addLine(to: topLineRight)

        return p
    }
}




