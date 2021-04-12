//
//  CardShape.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 08/04/21.
//

import SwiftUI

struct CardShape: Shape {
    let pathFunction: (CGRect) -> Path
    
    func path(in rect: CGRect) -> Path {
        pathFunction(rect)
    }
    
    func shadify(with shading: Card.Shading) -> some View {
        return Group {
            switch (shading) {
            case .solid:
                self
            case .striped:
                Striped(stripeLineWidth: UIK.strokeLineWidth, numberOfStripes: UIK.numberOfStripesInShape)
                    .mask(self)
                    .overlay(self.stroke(lineWidth: UIK.strokeLineWidth))
            case .open:
                self.stroke(lineWidth: UIK.strokeLineWidth)
            }
        }
    }
}
