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
    
    public var id: String { "\(color)\(shape)\(fill)\(count)" }
    
    
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
