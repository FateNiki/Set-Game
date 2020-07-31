//
//  Cardify.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                content
            }
        }
    }
    
    
    private let cornerRadius: CGFloat = 15.0
    private let lineWidth: CGFloat = 3.0
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}
