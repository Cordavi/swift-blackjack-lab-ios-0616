//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Michael Amundsen on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
   var deck = Deck()
   let house = House(name: "House")
   let player = House(name: "Player")
   var bet: UInt = 0
   
   func placeBet(newBet: UInt) -> Bool {
      if house.canPlaceBet(newBet) && player.canPlaceBet(newBet) {
         bet = newBet
         return true
      }
      return false
   }
   
   func deal() {
      while player.cards.count < 2 && house.cards.count < 2 {
         player.cards.append(deck.drawCard())
         house.cards.append(deck.drawCard())
      }
      player.stayed = false
      house.stayed = false
   }
   
   func turn(player: House) {
      guard player.mayHit else { return }
      
      if player.mustHit {
         player.cards.append(deck.drawCard())
      }
      player.stayed = true
   }
   
   func winner() -> String {
      if player.blackjack || house.blackjack {
         switch (player.blackjack, house.blackjack) {
         case (true, false):
            return "player"
         case (false, true):
            return "house"
         default:
            break
         }
      }
      
      guard !player.busted else { return "house" }
      
      guard !house.busted else { return "player" }
      
      guard player.cards.count != 5 else { return "player" }
      
      if player.stayed && house.stayed {
         guard house.handscore != player.handscore else { return "house" }
         
         if player.handscore > house.handscore {
            return "player"
         } else {
            return "house"
         }
      }
      
      return "no"
   }
   
   func award() -> String {
      let roundWinner = winner()
      player.cards.removeAll()
      house.cards.removeAll()
      
      switch roundWinner {
      case "house":
         house.didWin(bet)
         player.didLose(bet)
         return "House wins!"
      case "player":
         house.didLose(bet)
         player.didWin(bet)
         return "Player wins!"
      default:
         return "No winner"
      }
   }
}

//"Result of the round: \(player.description)\n\(house.description)"