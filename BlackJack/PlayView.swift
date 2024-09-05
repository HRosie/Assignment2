import SwiftUI

struct PlayView: View {
    @StateObject private var game = BlackjackGame()
    @EnvironmentObject var playerManager: PlayerManager
    
    var body: some View {
        VStack {
            Text("Blackjack")
                .font(.largeTitle)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Dealer's Hand:")
                HStack {
                    ForEach(game.dealerHand, id: \.imageName) { card in
                        Image(card.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 100)
                            .padding(2)
                    }
                }
                
                Text("Player's Hand:")
                HStack {
                    ForEach(game.playerHand, id: \.imageName) { card in
                        Image(card.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 100)
                            .padding(2)
                    }
                }
                
                Text("Player's Hand Value: \(game.handValue(for: game.playerHand))")
                Text("Dealer's Hand Value: \(game.handValue(for: game.dealerHand))")
                
                if game.gameOver {
                    Text(game.message)
                        .font(.headline)
                        .padding()
                }
            }
            .padding()
            
            HStack {
                Button(action: {
                    if game.gameOver {
                        game.startGame()
                    } else {
                        game.playerHit()
                    }
                }) {
                    Text(game.gameOver ? "New Game" : "Hit")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    if !game.gameOver {
                        game.playerStand()
                    }
                }) {
                    Text("Stand")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            game.startGame()
        }
        .onChange(of: game.gameOver) { newValue in
            if newValue {
                playerManager.updatePlayerStats(
                    gamesPlayed: 1,
                    gamesWon: game.message.contains("win") ? 1 : 0,
                    gamesLost: game.message.contains("lose") ? 1 : 0
                )
            }
        }
    }
}