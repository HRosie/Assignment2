import Foundation

class PlayerManager: ObservableObject {
    @Published var currentPlayer: Player?
    
    private let playerFileName = "currentPlayer.json"
    
    init() {
        loadPlayer()
    }
    
    func createNewPlayer(username: String) {
        let newPlayer = Player(id: UUID(), username: username, gamesPlayed: 0, gamesWon: 0, gamesLost: 0)
        savePlayer(player: newPlayer)
    }
    
    func signInPlayer(username: String) {
        // In a real app, you would verify if the player exists and then sign in
        // Here we assume that we are creating or loading a player with that username
        let existingPlayer = Player(id: UUID(), username: username, gamesPlayed: 0, gamesWon: 0, gamesLost: 0)
        savePlayer(player: existingPlayer)
    }
    
    private func savePlayer(player: Player) {
        currentPlayer = player
        let fileURL = getDocumentsDirectory().appendingPathComponent(playerFileName)
        do {
            let encoded = try JSONEncoder().encode(player)
            try encoded.write(to: fileURL)
        } catch {
            print("Failed to save player: \(error.localizedDescription)")
        }
    }
    
    private func loadPlayer() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(playerFileName)
        do {
            let data = try Data(contentsOf: fileURL)
            let player = try JSONDecoder().decode(Player.self, from: data)
            currentPlayer = player
        } catch {
            print("Failed to load player: \(error.localizedDescription)")
        }
    }
    
    func updatePlayerStats(gamesPlayed: Int, gamesWon: Int, gamesLost: Int) {
        guard var player = currentPlayer else { return }
        player.gamesPlayed += gamesPlayed
        player.gamesWon += gamesWon
        player.gamesLost += gamesLost
        savePlayer(player: player)
    }
    
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}