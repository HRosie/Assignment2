import SwiftUI

struct ScoreboardView: View {
    @EnvironmentObject var playerManager: PlayerManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Scoreboard")
                .font(.largeTitle)
                .bold()
            
            if let player = playerManager.currentPlayer {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Username: \(player.username)")
                        .font(.title2)
                    Text("Games Played: \(player.gamesPlayed)")
                        .font(.title2)
                    Text("Games Won: \(player.gamesWon)")
                        .font(.title2)
                    Text("Games Lost: \(player.gamesLost)")
                        .font(.title2)
                }
                .padding()
            } else {
                Text("No player signed in.")
                    .font(.title2)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}