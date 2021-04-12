//
//  Cardify.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var card: Card
    var theme: Theme
    
    init(card: Card, theme: Theme) {
        self.card = card
        self.theme = theme
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: UIK.cornerRadius)
                .fill(Color.white)
                .shadow(radius: UIK.shadowRadius)
            
            if card.isChosen {
                RoundedRectangle(cornerRadius: UIK.cornerRadius)
                    .stroke(lineWidth: UIK.strokeLineWidth + 3.5)
                    .fill(theme.colors[card.cardColor.rawValue])
            } else {
                RoundedRectangle(cornerRadius: UIK.cornerRadius)
                    .stroke(lineWidth: UIK.strokeLineWidth)
                    .fill(theme.linearGradient)
            }
            
            content
        }
    }
}

extension View {
    func cardify(card: Card, theme: Theme) -> some View {
        self.modifier(Cardify(card: card, theme: theme))
    }
}
