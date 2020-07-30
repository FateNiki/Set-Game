//
//  SetViewModel.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

class SetGameViewModel {
    // TODO Перенести в модель
    static private func generateAllCards() -> Array<Card> {
        var cards = Array<Card>()
        for color in Card.Color.allCases {
            for shape in Card.Shape.allCases {
                for fill in Card.Fill.allCases {
                    for count in Card.Count.allCases {
                        cards.append(.init(color: color, shape: shape, fill: fill, count: count))
                    }
                }
            }
        }
        return cards
    }
    
    var cards: Array<Card>
    
    init() {
        cards = Self.generateAllCards()
    }
}
