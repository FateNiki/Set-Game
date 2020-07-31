//
//  Shape.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import SwiftUI

struct Rhomb: Shape {
    
    func path(in rect: CGRect) -> Path {
        rhomb(in: rect)
    }
    
    private func rhomb(in rect: CGRect) -> Path {
        let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        let halfOfHeight = min(rect.width / 3, rect.height / 2)
        let halfOfWidth = halfOfHeight * 3 / 2
        let start = CGPoint(
            x: center.x,
            y: center.y - halfOfHeight
        )
        
        var path = Path()
        path.addLines([
            start,
            CGPoint(x: center.x - halfOfWidth, y: center.y),
            CGPoint(x: center.x, y: center.y + halfOfHeight),
            CGPoint(x: center.x + halfOfWidth, y: center.y),
            start
        ])
        return path
    }
    
    
}

struct Rhomb_Previews: PreviewProvider {
    static var previews: some View {
        Rhomb().overlay(Rhomb().stroke(Color.red))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
