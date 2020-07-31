//
//  Array+Card.swift
//  Set Game
//
//  Created by Алексей Никитин on 31.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

extension Array where Element == Card {
    internal func isSet() -> Bool? {
        guard self.count == 3 else { return nil }
        let countMark = Set(self.map{ $0.count }).count
        let shapeMark = Set(self.map{ $0.shape }).count
        let fillMark = Set(self.map{ $0.fill }).count
        let colorMark = Set(self.map{ $0.color }).count
        return (countMark == 1 || countMark == 3) &&
                (shapeMark == 1 || shapeMark == 3) &&
                (fillMark == 1 || fillMark == 3) &&
                (colorMark == 1 || colorMark == 3)
    }
}
