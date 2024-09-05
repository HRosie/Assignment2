import Foundation

enum Suit: String {
    case hearts = "Hearts"
    case diamonds = "Diamonds"
    case clubs = "Clubs"
    case spades = "Spades"
}

enum Rank: String {
    case two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", jack = "Jack", queen = "Queen", king = "King", ace = "Ace"
    
    var value: Int {
        switch self {
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .ten, .jack, .queen, .king: return 10
        case .ace: return 11
        }
    }
}

struct Card {
    let suit: Suit
    let rank: Rank
    
    var imageName: String {
        "\(rank.rawValue)_of_\((suit.rawValue).lowercased())"
    }
}