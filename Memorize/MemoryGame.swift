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
    
    // all functions that modify the "self" must be marked as __mutating__
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let choosenIndex: Int = self.index(of: card)
        self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp
    }
    
    // of - public name
    // card - private name
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        
        return -1 // TODO: trow error
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
