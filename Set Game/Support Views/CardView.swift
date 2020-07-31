//
//  CardView.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        VStack {
            ForEach(0..<card.count.rawValue) { _ in
                CardShape(card: self.card, lineWidth: self.lineWidth(for: size))
            }
        }
            .padding(self.paddingLength(for: size))
            .cardify(card)
    }
    
    //MARK: - Drawing Constants
    private func paddingLength(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.15
    }
    private func lineWidth(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.02
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(SetGame.allCards[0..<5]) { card in
            CardView(card: card)
        }
            .previewLayout(.fixed(width: 300, height: 400))
    }
}
