//
//  Theme.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import SwiftUI

struct Theme {
    // MARK: - Custom Data Structures
    
    enum Types: String {
        case standard
        case brazil
        case usa
    }
    
    // MARK: - Properties
    
    var type: Types
    var name: String {
        return type.rawValue.capitalizingFirstLetter()
    }
    
    var colors: [Color] {
        switch self.type {
        case .standard:
            return [.red, .green, .blue]
        case .brazil:
            return [.blue, .green, .yellow]
        case .usa:
            return [.red, .blue, .gray]
        }
    }
    
    var primaryColor: Color {
        colors.first!
    }
    
    var linearGradient: LinearGradient {
        colors.linearGradient()!
    }
}
