//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Michael Amundsen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    let cardLabel: String
    let cardValue: Int?
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        cardLabel = suit + rank
        cardValue = Card.setCardValue(rank)
        
    }
    
    var description: String {
        get {
            return cardLabel
        }
    }
    
    class func setCardValue(rank: String) -> Int? {
        switch rank {
        case "A":
            return 1
        case "J", "Q", "K":
            return 10
        default:
            let cardValue = Int(rank)
            if let cardValue = cardValue {
                return Int(cardValue)
            }
        }
        return nil
    }
    
    class func validSuits() -> [String] {
        return ["♠", "♥", "♦", "♣︎"]
    }
    
    class func validRanks() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
}
