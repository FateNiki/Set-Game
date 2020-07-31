//
//  CardShape.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import SwiftUI

struct CardShape: View {
    let card: Card
    
    var body: some View {
        var shape: AnyView
        switch card.shape {
            case .ellipse: shape = AnyView(ellipse)
            case .quadrate: shape = AnyView(rectangle)
            case .rhomb: shape = AnyView(rhomb)
        }
        return shape.aspectRatio(3/2, contentMode: .fit)
    }
    
    private var ellipse: some View {
        ZStack {
            if card.fill == .empty {
                Ellipse().opacity(0)
            } else if card.fill == .full {
                Ellipse()
            } else {
                Ellipse().scale(0.5).opacity(1)
            }
            Ellipse().stroke(color, lineWidth: lineWidth)
        }.foregroundColor(color)
    }
    
    private var rhomb: some View {
        ZStack {
            if card.fill == .empty {
                Rhomb().opacity(0)
            } else if card.fill == .full {
                Rhomb()
            } else {
                Rhomb().scale(0.5).opacity(1)
            }
            Rhomb().stroke(color, lineWidth: lineWidth)
        }.foregroundColor(color)
    }
    
    private var rectangle: some View {
        ZStack {
            if card.fill == .empty {
                Rectangle().opacity(0)
            } else if card.fill == .full {
                Rectangle()
            } else {
                Rectangle().scale(0.5).opacity(1)
            }
            Rectangle().stroke(color, lineWidth: lineWidth)
        }.foregroundColor(color)
    }
    
    
    //MARK: - Drawing Constants
    private let lineWidth: CGFloat = 5
    
    private var color: Color {
        switch card.color {
            case .blue: return .blue
            case .green: return .green
            case .red: return .red
        }
    }
}

struct CardShape_Previews: PreviewProvider {
    static var previews: some View {
        CardShape(card: Card(color: .blue, shape: .quadrate, fill: .hatch, count: .one)).preferredColorScheme(.dark)
    }
}
