//
//  CardView.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 05/04/21.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    let theme: Theme
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        let height: CGFloat = size.height * Constant.cardShapeHeightProportion
        let width: CGFloat = size.width * Constant.cardShapeWidthProportion
        
        return VStack(spacing: Constant.spacingBetweenShapes) {
            ForEach(1...card.number.rawValue, id: \.self) { _ in
                Group {
                    if card.shape == .diamond {
                        Diamond()
//                            .strokeBorder(Color.blue,lineWidth: 4)
//                            .background(Color.white)
                    } else if card.shape == .oval {
                        Oval()
//                            .strokeBorder(Color.blue,lineWidth: 4)
//                            .background(Color.white)
                    } else if card.shape == .squiggle {
                        Squiggle()
                            .stroke(lineWidth: Constant.strokeLineWidth)
//                            .strokeBorder(Color.blue,lineWidth: 4)
//                            .background(Color.white)
                    }
                }
//                .strokeBorder(Color.blue,lineWidth: 4)
//                .background(Color.white)
                .foregroundColor(theme.colors[card.cardColor.rawValue])
                .frame(width: width, height: height)
            }
        }
        .position(x: size.width/2, y: size.height/2)
    }
}
