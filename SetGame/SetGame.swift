//
//  SetGame.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import Foundation

struct SetGame {
    // MARK: - Constants
    
    private let maxNumberOfDealtCards = 30
    
    // MARK: - Instance Properties
    
    private(set) var cards: [Card]
    private(set) var numberOfDealtCards = 12 // initial value
    
    var dealtCards: [Card] {
        cards.filter { $0.isDealt }
    }
    
    var reachedMaxDealtCards: Bool {
        numberOfDealtCards == maxNumberOfDealtCards
    }
    
    init(offset: Int = 0) {
        cards = [Card]()
        var index: Int = 0
        
        for number in Card.Number.allCases {
            for shape in Card.Shape.allCases {
                for shading in Card.Shading.allCases {
                    for cardColor in Card.CardColor.allCases {
                        cards.append(
                            Card(
                                id: offset + index,
                                number: number,
                                shape: shape,
                                shading: shading,
                                cardColor: cardColor)
                            )
                        index += 1
                    }
                }
            }
        }
        
        cards.shuffle()
        for index in 0..<numberOfDealtCards {
            cards[index].isDealt = true
        }
    }
    
    struct Card: Identifiable {
        private(set) var id: Int
        var isDealt: Bool
        
        enum Number: Int, CaseIterable {
            case one = 1
            case two
            case three
        }
        var number: Number
        
        enum Shape: Int, CaseIterable {
            case diamond = 0
            case squiggle
            case oval
        }
        var shape: Shape
        
        enum Shading: Int, CaseIterable {
            case solid = 0
            case semiOpaque
            case open
        }
        var shading: Shading
        
        enum CardColor: Int, CaseIterable {
            case primary = 0
            case secondary
            case tertiary
        }
        var cardColor: CardColor
        
        init(id: Int, number: Number, shape: Shape, shading: Shading, cardColor: CardColor) {
            self.id = id
            self.number = number
            self.shape = shape
            self.shading = shading
            self.cardColor = cardColor
            self.isDealt = false
        }
    }
    
    mutating func dealCards() {
        
        let newNumberOfDealtCards = min(numberOfDealtCards + 3, cards.count, maxNumberOfDealtCards)
        for index in numberOfDealtCards..<newNumberOfDealtCards {
            cards[index].isDealt = true
        }
        numberOfDealtCards = newNumberOfDealtCards
    }
}
