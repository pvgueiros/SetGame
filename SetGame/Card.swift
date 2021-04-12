//
//  Card.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 08/04/21.
//

import Foundation

struct Card: Identifiable {
    
    // MARK: - Properties
    
    private(set) var id: Int
    var isDealt: Bool
    var isChosen: Bool
    
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
        case striped
        case open
    }
    var shading: Shading
    
    enum CardColor: Int, CaseIterable {
        case primary = 0
        case secondary
        case tertiary
    }
    var cardColor: CardColor
    
    // MARK: - Initialization
    
    init(id: Int, number: Number, shape: Shape, shading: Shading, cardColor: CardColor) {
        self.id = id
        self.number = number
        self.shape = shape
        self.shading = shading
        self.cardColor = cardColor
        self.isDealt = false
        self.isChosen = false
    }
    
    // MARK: - Logging
    
    var description: String {
        """
        Card:
            Number: \(number.rawValue)
            Shape: \(shape)
            Color: \(cardColor)
            Shading: \(shading)
        """
    }
}
