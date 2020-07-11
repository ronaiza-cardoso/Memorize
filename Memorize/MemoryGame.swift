//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ronaiza Cardoso on 11/07/2020.
//  Copyright © 2020 Ronaiza Cardoso. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent > {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card choosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let contend = cardContentFactory(pairIndex)
            
            cards.append(Card(contend: contend, id: pairIndex * 2 ))
            cards.append(Card(contend: contend, id: pairIndex * 2 + 1 ))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var contend: CardContent
        var id: Int
    }
}
