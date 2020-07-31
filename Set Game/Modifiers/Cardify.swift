//
//  Cardify.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    let card: Card
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                    .shadow(color: shadowColor, radius: card.isSelected ? 5 : 0)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.accentColor, lineWidth: lineWidth)
                content
            }
        }
        .scaleEffect(card.isSelected ? 1.2 : 1)
    }
    
    
    private let cornerRadius: CGFloat = 15.0
    private let lineWidth: CGFloat = 2.0
    private var shadowColor: Color {
        switch card.isMatching {
            case true: return Color.green
            case false: return Color.red
            default: return Color.accentColor
        }
    }
}

extension View {
    func cardify(_ card: Card) -> some View {
        self.modifier(Cardify(card: card))
    }
}
