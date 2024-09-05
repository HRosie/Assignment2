import Foundation

class BlackjackGame: ObservableObject {
    @Published var playerHand: [Card] = []
    @Published var dealerHand: [Card] = []
    @Published var message: String = "Welcome to Blackjack!"
    @Published var gameOver: Bool = false
    @Published var deck = Deck()

    func startGame() {
        playerHand.removeAll()
        dealerHand.removeAll()
        gameOver = false
        
        for _ in 1...2 {
            playerHand.append(deck.drawCard()!)
            dealerHand.append(deck.drawCard()!)
        }
        
        checkGameStatus()
    }
    
    func playerHit() {
        if !gameOver {
            playerHand.append(deck.drawCard()!)
            checkGameStatus()
        }
    }
    
    func playerStand() {
        if !gameOver {
            dealerPlay()
            checkGameStatus()
        }
    }
    
    private func dealerPlay() {
        while handValue(for: dealerHand) < 17 {
            dealerHand.append(deck.drawCard()!)
        }
    }
    
    private func handValue(for hand: [Card]) -> Int {
        var value = hand.map { $0.rank.value }.reduce(0, +)
        let aces = hand.filter { $0.rank == .ace }.count
        
        while value > 21 && aces > 0 {
            value -= 10
            aces -= 1
        }
        return value
    }
    
    private func checkGameStatus() {
        let playerValue = handValue(for: playerHand)
        let dealerValue = handValue(for: dealerHand)
        
        if playerValue > 21 {
            message = "Player busts! Dealer wins."
            gameOver = true
        } else if dealerValue > 21 {
            message = "Dealer busts! Player wins."
            gameOver = true
        } else if playerValue == 21 {
            message = "Player wins with Blackjack!"
            gameOver = true
        } else if dealerValue == 21 {
            message = "Dealer wins with Blackjack!"
            gameOver = true
        } else if gameOver {
            if playerValue > dealerValue {
                message = "Player wins!"
            } else if playerValue < dealerValue {
                message = "Dealer wins!"
            } else {
                message = "It's a tie!"
            }
        }
    }
}