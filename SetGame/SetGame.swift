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
    private let initialNumberOfDealtCards = 12
    private let maxNumberOfChosenCards = 3
    
    // MARK: - Instance Properties
    
    private(set) var cards: [Card]
    
    var dealtCards: [Card] {
        cards.filter { $0.isDealt }
    }
    
    private var numberOfDealtCards: Int {
        dealtCards.count
    }
    
    var reachedMaxDealtCards: Bool {
        numberOfDealtCards == maxNumberOfDealtCards
    }
    
    private var chosenCards: [Card] {
        cards.filter { $0.isChosen }
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
        for index in 0..<initialNumberOfDealtCards {
            dealCardAt(index: index)
        }
    }
    
    // MARK: - Intents
    
    mutating func dealThreeCards() {
        let newNumberOfDealtCards = min(numberOfDealtCards + 3, cards.count, maxNumberOfDealtCards)
        
        for index in numberOfDealtCards..<newNumberOfDealtCards {
            dealCardAt(index: index)
        }
    }
    
    private mutating func dealCardAt(index: Int) {
        cards[index].isDealt = true
        print("Dealt \(cards[index].description)")
    }
    
    mutating func select(_ card: Card) {
        let index = cards.firstIndex(matching: card)!
        
        if chosenCards.count < maxNumberOfChosenCards {
            toggleCardAt(index: index)
        } else {
            chooseSingle(card)
        }
    }
    
    private mutating func chooseSingle(_ card: Card) {
        for index in 0..<numberOfDealtCards {
            cards[index].isChosen = (cards[index].id == card.id)
        }
    }
    
    private mutating func toggleCardAt(index: Int) {
        cards[index].isChosen = !cards[index].isChosen
    }
}
