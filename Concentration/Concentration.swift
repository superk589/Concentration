//
//  Concentration.swift
//  Concentration
//
//  Created by zzk on 15/11/2017.
//  Copyright © 2017 zzk. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards: [Card]
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices ~= index, "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        cards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: shuffle the cards

    }
}


extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}
