//
//  Diamond.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 05/04/21.
//

import SwiftUI

struct Diamond: Shape {
    // MARK: - Required Shape Methods
    
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.midX, y: 0)

        var p = Path()
        p.move(to: start)
        p.addLine(to: CGPoint(x: 0, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.addLine(to: start)

        return p
    }
}

