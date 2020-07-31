//
//  set-game.model.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import Foundation

struct Card: Identifiable {
    let color: Color
    let shape: Shape
    let fill: Fill
    let count: Count
    
    public var id: String { "\(color)_\(shape)_\(fill)_\(count)" }
    
    
    enum Color: CaseIterable {
        case red
        case blue
        case green
    }
    
    enum Shape: CaseIterable {
        case rhomb
        case ellipse
        case quadrate
    }
    
    enum Fill: CaseIterable {
        case empty
        case full
        case hatch
    }
    
    enum Count: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }
}

struct SetGame {
    static let startCountOfCards: Int = 12
    static let additionCountOfCards: Int = 3
    
    static var allCards: Array<Card> {
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
        return cards.shuffled()
    }
    
    private(set) var deckCards: Array<Card> = []
    private(set) var tableCards: Array<Card> = []
    
    private mutating func pushCards(countOfCards: Int) -> Void {
        let count = min(countOfCards, deckCards.count)
        tableCards.append(contentsOf: deckCards.prefix(count))
        deckCards.removeFirst(count)
    }
    
    public mutating func pushAdditionCards() {
        pushCards(countOfCards: Self.additionCountOfCards)

    }
    
    public mutating func startGame() -> Void {
        deckCards = Self.allCards
        tableCards = []
        pushCards(countOfCards: Self.startCountOfCards)
    }
}
