//
//  SetGameView.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import SwiftUI

struct SetGameView: View {
    // MARK: - Instance Properties
    
    @ObservedObject var gameViewModel: SetGameViewModel
    @State var cardsShown = 0
    
    // MARK: - Animation

    private func show(_ card: Card) {
        withAnimation(Animation.easeInOut(duration: UIK.cardAppearAnimationDuration)
                        .delay(Double(cardsShown)*UIK.cardAppearAnimationDuration + UIK.offsetCardAppearAnimation)) {
            gameViewModel.show(card)
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
                    .padding(UIK.shortPaddingLength)
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        dealThreeCards()
                    }
                }, label: {
                    Text("Deal")
                })
                .disabled(gameViewModel.reachedMaxDealtCards)
                .foregroundColor(dealButtonTextColor)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: UIK.cornerRadius)
                        .stroke(lineWidth: UIK.strokeLineWidth).fill(gameViewModel.theme.linearGradient)
                )
            }
            .padding(.leading)
            .padding(.trailing)
            
            Grid(gameViewModel.dealtCards, cardIsHiddenByID: gameViewModel.cardIsHiddenByID) { card in
                CardView(card: card, theme: gameViewModel.theme)
                    .cardify(card: card, theme: gameViewModel.theme)
                    .padding(UIK.shortPaddingLength)
                    .onAppear {
                        show(card)
                    }
                    .onTapGesture {
                        gameViewModel.select(card)
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
                RoundedRectangle(cornerRadius: UIK.cornerRadius)
                    .stroke(lineWidth: UIK.strokeLineWidth).fill(gameViewModel.theme.linearGradient)
            )
        }
        .padding(UIK.shortPaddingLength)
        .foregroundColor(.primary)
    }
    
    // MARK: - Actions
    
    private func startNewGame() {
        cardsShown = 0
        
        gameViewModel.startNewGame()
    }
    
    private func dealThreeCards() {
        UIK.offsetCardAppearAnimation = 0.2
        cardsShown = 0
        
        gameViewModel.dealThreeCards()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let gameViewModel = SetGameViewModel()
        return SetGameView(gameViewModel: gameViewModel)
    }
}
