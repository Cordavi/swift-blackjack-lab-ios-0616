//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
   var window: UIWindow?
   
   var dealer = Dealer()
   
   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      playBlackjack()
      playBlackjack()
      playBlackjack()
      playBlackjack()
      playBlackjack()
      
      
      // Do not alter
      return true  //
   }   ///////////////
   
   func playBlackjack() {
      dealer.placeBet(150)
      dealer.deck.shuffle()
      print(dealer.deck.shuffle())
      dealer.deal()
      print("\(dealer.player.description)\n\n\(dealer.house.description)\n")
      
      guard dealer.winner() != "No" else { return }
      
      while dealer.player.cards.count <= 5 {
         dealer.turn(dealer.player)
         guard dealer.winner() == "No" else { break }
      }
      
      while dealer.house.cards.count <= 5 {
         dealer.turn(dealer.house)
         guard dealer.winner() == "No" else { break }
      }
      
      for card in dealer.player.cards {
         print("Player's Cards: \(card.description)")
      }
      
      for card in dealer.house.cards {
         print("House's Cards: \(card.description)")
      }
      
      print("\nPlayer score: \(dealer.player.handscore)")
      print("House score: \(dealer.house.handscore)")
      
      print("\n\(dealer.winner())\n")
      dealer.award()
      dealer.deck.collectDealtCards()
   }
   
}

