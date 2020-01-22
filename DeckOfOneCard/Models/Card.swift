//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Maxwell Poffenbarger on 1/22/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation

struct Card: Decodable {
    
    var value: String
    var suit: String
    var image: URL
    
}//End of struct

struct TopLevelObject: Decodable {
    
    var cards: [Card]
    
}//End of struct
