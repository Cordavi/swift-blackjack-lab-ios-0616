//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Michael Amundsen on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
   override init(name: String) {
      super.init(name: name)
      self.tokens = 1000
   }
}

//MARK: Computed Properties

extension House {
   var mustHit: Bool {
      if self.handscore < 17 {
         return true
      }
      return false
   }
}