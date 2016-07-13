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
      //set bet ammount
      dealer.placeBet(150)
      
      //shuffle the deck
      dealer.deck.shuffle()
      
      //deal inital cards to player and house
      dealer.deal()
      print("\(dealer.player.description)\n\n\(dealer.house.description)\n")
      
      //check if their is a winner on deal
      guard dealer.winner() != "No" else { return }
      
      //Allows player to play out their turn(s)
      while dealer.player.cards.count <= 5 {
         dealer.turn(dealer.player)
         guard dealer.winner() == "No" else { break }
      }
      
      //Allow house to play out their turn(s)
      while dealer.house.cards.count <= 5 {
         dealer.turn(dealer.house)
         guard dealer.winner() == "No" else { break }
      }
      
      //Print the winner of the round and the players hands/scores
      print("\(dealer.player.description)\n\n\(dealer.house.description)\n")
      print("\n\(dealer.winner())\n")
      
      //Award tokens to winning player and subtracts from losing player
      dealer.award()
   }
   
}

