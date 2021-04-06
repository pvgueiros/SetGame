//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import Foundation

class SetGameViewModel: ObservableObject {
    // MARK: - Type Properties
    
    private static var offset = 0
    
    // MARK: - Stored Properties
    
    @Published private var game: SetGame
    @Published var cardIsHiddenByID: [Int: Bool]
    var theme: Theme
    
    // MARK: - Computed Properties
    
    var cards: [SetGame.Card] { game.cards }
    var dealtCards: [SetGame.Card] { game.dealtCards }
    var reachedMaxDealtCards: Bool { game.reachedMaxDealtCards }
    
    // MARK: - Initialization
    
    init() {
        let newGame = SetGame()
        game = newGame
        theme = Theme(type: .standard)
        cardIsHiddenByID = newGame.cards.reduce([Int: Bool]()) { (dictionary, card) -> [Int: Bool] in
            var dictionary = dictionary
            dictionary[card.id] = true
            return dictionary
        }
    }
    
    func startNewGame() {
        Self.offset += game.cards.count
        game = SetGame(offset: Self.offset)
        
        cardIsHiddenByID = game.cards.reduce([Int: Bool]()) { (dictionary, card) -> [Int: Bool] in
            var dictionary = dictionary
            dictionary[card.id] = true
            return dictionary
        }
    }
    
    // MARK: - Intent(s)
    
    func choose(card: SetGame.Card) {
        #warning("implement")
    }
    
    func show(card: SetGame.Card) {
        cardIsHiddenByID[card.id] = false
    }
    
    func dealCards() {
        game.dealCards()
    }
}
