//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Michael Amundsen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
   let name: String
   var cards: [Card]
   var stayed: Bool
   var tokens: UInt
   
   init(name: String) {
      self.name = name
      cards = []
      stayed = false
      tokens = 100
   }
   
   private func calculateAceValue(totalScore: Int, aceCount: Int) -> Int {
      guard aceCount > 0 else {
         return totalScore
      }
      
      var calculatedScore = totalScore
      for i in 0..<aceCount {
         if calculatedScore + 11 <= 21 && i == aceCount - 1 {
            return calculatedScore + 11
         } else {
            calculatedScore += 1
         }
      }
      return calculatedScore
   }
   
   func canPlaceBet(bet: UInt) -> Bool {
      if bet <= tokens {
         return true
      }
      return false
   }
   
   func didWin(bet: UInt) {
      tokens += bet
   }
   
   func didLose(bet: UInt) {
      tokens -= bet
   }
}

//MARK: Computed Properties

extension Player {
   var handscore: Int {
      var aceCount = 0
      let totalScore: Int = cards.reduce(0){
         guard $1.cardValue != 1 else {
            aceCount += 1
            return $0
         }
           return $0 + ($1.cardValue ?? 0)
      }
      return calculateAceValue(totalScore, aceCount: aceCount)
   }
   
   var blackjack: Bool {
      if handscore == 21 && cards.count == 2 {
         return true
      }
      return false
   }
   
   var busted: Bool {
      if handscore > 21 {
         return true
      }
      return false
   }
   
   var mayHit: Bool {
      if blackjack == false && busted == false && stayed == false {
         return true
      }
      return false
   }
   
   var description: String {
      return "Player: \(name)\nCards: \(cards)\nHandscore: \(handscore)\nBlackjack: \(blackjack)\nBusted: \(busted)\nStayed: \(stayed)\nMay Hit: \(mayHit)\nTokens: \(tokens)"
   }
}