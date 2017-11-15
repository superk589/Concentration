//
//  Card.swift
//  Concentration
//
//  Created by zzk on 15/11/2017.
//  Copyright © 2017 zzk. All rights reserved.
//

import Foundation

struct Card {

    var isFaceUp = false
    
    var isMatched = false
    
    var identifier: Int

    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
