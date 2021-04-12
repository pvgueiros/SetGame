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
        case pretty
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
        case .pretty:
            return [Color(red: 0.87, green: 0.70, blue: 0.08),
                    Color(red: 0.21, green: 0.64, blue: 0.87),
                    Color(red: 0.86, green: 0.25, blue: 0.63)]
        }
    }
    
    var primaryColor: Color {
        colors.first!
    }
    
    var linearGradient: LinearGradient {
        colors.linearGradient()!
    }
}
