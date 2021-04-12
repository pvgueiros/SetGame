//
//  CardView.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 05/04/21.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let theme: Theme
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        let height: CGFloat = size.height * UIK.cardShapeHeightProportion
        let width: CGFloat = size.width * UIK.cardShapeWidthProportion
        
        return VStack(spacing: UIK.spacingBetweenShapes) {
            ForEach(1...card.number.rawValue, id: \.self) { _ in
                shapify(card)
                    .frame(width: width, height: height)
            }
        }
        .position(x: size.width/2, y: size.height/2)
    }

    func shapify(_ card: Card) -> some View {
        var cardShape: CardShape
        
        switch (card.shape) {
        case .diamond:
            cardShape = CardShape(pathFunction: Diamond().path)
        case .oval:
            cardShape = CardShape(pathFunction: Oval().path)
        case .squiggle:
            cardShape = CardShape(pathFunction: Squiggle().path)
        }
        
        return cardShape
            .shadify(with: card.shading)
            .foregroundColor(theme.colors[card.cardColor.rawValue])
    }
}
