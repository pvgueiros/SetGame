//
//  SetGameApp.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import SwiftUI

@main
struct SetGameApp: App {
    let setGameViewModel = SetGameViewModel()

    var body: some Scene {
        WindowGroup {
            SetGameView(gameViewModel: setGameViewModel)
        }
    }
}
