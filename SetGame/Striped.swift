//
//  Striped.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 08/04/21.
//

import SwiftUI

struct Striped: Shape {

    // MARK: - Instance Properties

    let stripeLineWidth: CGFloat
    let numberOfStripes: Int

    // MARK: - Required Shape Methods

    func path(in rect: CGRect) -> Path {
        let spacing = rect.width / CGFloat(numberOfStripes)
        let initialX = rect.minX - stripeLineWidth/2

        var p = Path()
        for index in 1..<numberOfStripes {
            
            let currentX: CGFloat = initialX + CGFloat(index)*spacing
            p.addRect(CGRect(
                        x: currentX,
                        y: rect.minY,
                        width: stripeLineWidth,
                        height: rect.height))
        }

        return p
    }
}
