//
//  SetGameView.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import SwiftUI

struct SetGameConstants {
    static let shortPaddingLength: CGFloat = 5
    static let cornerRadius: CGFloat = 10
    static let strokeLineWidth: CGFloat = 2
    static let shadowRadius: CGFloat = 3
    
    static let cardShapeHeightProportion: CGFloat = 0.2
    static let cardShapeWidthProportion: CGFloat = 0.6
    static let spacingBetweenShapes: CGFloat = 5
    
    static let cardAppearAnimationDuration = 0.1
    static var offsetCardAppearAnimation = 0.0
}
typealias Constant = SetGameConstants

struct SetGameView: View {
    // MARK: - Instance Properties
    
    @ObservedObject var gameViewModel: SetGameViewModel
    @State var cardsShown = 0
    
    // MARK: - Animation

    private func show(card: SetGame.Card) {
        withAnimation(Animation.easeInOut(duration: Constant.cardAppearAnimationDuration)
                        .delay(Double(cardsShown)*Constant.cardAppearAnimationDuration + Constant.offsetCardAppearAnimation)) {
            gameViewModel.show(card: card)
        }
        cardsShown += 1
    }
    
    // MARK: - UI Properties

    var dealButtonTextColor: Color {
        return gameViewModel.reachedMaxDealtCards ? Color.gray : Color.primary
    }
    
    // MARK: - UI Build
    
    var body: some View {
        VStack {
            HStack {
                Text("Score: ")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(Constant.shortPaddingLength)
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        dealCards()
                    }
                }, label: {
                    Text("Deal")
                })
                .disabled(gameViewModel.reachedMaxDealtCards)
                .foregroundColor(dealButtonTextColor)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: Constant.cornerRadius)
                        .stroke(lineWidth: Constant.strokeLineWidth).fill(gameViewModel.theme.linearGradient)
                )
            }
            .padding(.leading)
            .padding(.trailing)
            
            Grid(gameViewModel.dealtCards, cardIsHiddenByID: gameViewModel.cardIsHiddenByID) { card in
                CardView(card: card, theme: gameViewModel.theme)
                    .cardify(colorGradient: gameViewModel.theme.linearGradient, cornerRadius: Constant.cornerRadius, strokeLineWidth: Constant.strokeLineWidth, shadowRadius: Constant.shadowRadius)
                    .padding(Constant.shortPaddingLength)
                    .onAppear {
                        show(card: card)
                    }
            }
            
            Button(action: {
                withAnimation(.easeInOut) {
                    startNewGame()
                }
            }, label: {
                Text("New Game")
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .stroke(lineWidth: Constant.strokeLineWidth).fill(gameViewModel.theme.linearGradient)
            )
        }
        .padding(Constant.shortPaddingLength)
        .foregroundColor(.primary)
    }
    
    // MARK: - Actions
    
    private func startNewGame() {
        cardsShown = 0
        
        gameViewModel.startNewGame()
    }
    
    private func dealCards() {
        Constant.offsetCardAppearAnimation = 0.2
        cardsShown = 0
        
        gameViewModel.dealCards()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let gameViewModel = SetGameViewModel()
//        return SetGameView(gameViewModel: gameViewModel)
//    }
//}
