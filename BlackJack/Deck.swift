import Foundation

struct Deck {
    private var cards: [Card] = []
    
    init() {
        for suit in [Suit.hearts, .diamonds, .clubs, .spades] {
            for rank in [Rank.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace] {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        cards.shuffle()
    }
    
    mutating func drawCard() -> Card? {
        return cards.popLast()
    }
}