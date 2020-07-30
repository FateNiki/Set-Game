//
//  set-game.model.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import Foundation

struct Card {
    private(set) var color: Color
    private(set) var shape: Shape
    private(set) var fill: Fill
    private(set) var count: Count
    
    
    
    enum Color {
        case red
        case blue
        case green
    }
    
    enum Shape {
        case rhomb
        case ellipse
        case quadrate
    }
    
    enum Fill {
        case empty
        case full
        case hatch
    }
    
    enum Count: Int {
        case one = 1
        case two = 2
        case three = 3
    }
}
