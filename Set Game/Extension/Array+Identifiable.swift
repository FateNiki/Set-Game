//
//  Array+Identifiable.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

extension Array where Element: Identifiable {
    public func firstIndex(matching: Element) -> Int? {
        return self.firstIndex(where: { $0.id == matching.id })
    }
}
