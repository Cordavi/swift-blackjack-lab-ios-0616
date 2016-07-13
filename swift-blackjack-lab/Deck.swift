//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Michael Amundsen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var dealtCards: [Card]
    private var cardsInDeck: [Card]
    
    init() {
        self.dealtCards = []
        self.cardsInDeck = Deck.generateCardDeck()
    }
    
    class func generateCardDeck() -> [Card] {
        var cardDeck: [Card] = []
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                cardDeck.append(Card(suit: suit, rank: rank))
            }
        }
        return cardDeck
    }
    
    var description: String {
        get {
            return "Cards Remaining: \(cardsInDeck.count) Cards Dealt: \(dealtCards.count)"
        }
    }
    
    func drawCard() -> Card {
        let cardDrawn = cardsInDeck.removeLast()
        dealtCards.append(cardDrawn)
        return cardDrawn
    }
    
    func randomCardIndex(range: Int) -> Int {
        return Int(arc4random_uniform(UInt32(range)))
    }
    
    func collectDealtCards() {
        while !dealtCards.isEmpty {
            cardsInDeck.append(dealtCards.removeLast())
        }
    }
    
    func shuffle() {
        collectDealtCards()
        
        for currentCard in 0..<cardsInDeck.count - 1 {
            let randomCard = randomCardIndex(cardsInDeck.count)
            guard currentCard != randomCard else { continue }
            swap(&cardsInDeck[currentCard], &cardsInDeck[randomCard])
        }
    }
    
}