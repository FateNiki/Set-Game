//
//  SetViewModel.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//
import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var game = SetGame()
    
    //MARK: - Access to the Model
    var tableCards: Array<Card> { game.tableCards }
    var score: Int { game.score }
    var readyForChecking: Bool { game.readyForChecking }
    var allowForPushing: Bool { game.allowForPushing }
    
    //MARK: - Intent(s)
    func startGame() -> Void {
        game.startGame()
    }
    
    func pushAdditionCards() -> Void {
        game.pushAdditionCards()
    }
    
    func choose(card: Card) -> Void {
        game.choose(card: card)
    }
    
    func checkForSet() -> Void {
        let _ = game.checkForSet()
    }
}
