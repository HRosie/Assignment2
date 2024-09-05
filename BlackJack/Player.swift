import Foundation

struct Player: Codable, Identifiable {
    var id: UUID
    var username: String
    var gamesPlayed: Int
    var gamesWon: Int
    var gamesLost: Int
}

extension Player {
    static var samplePlayer: Player {
        Player(id: UUID(), username: "SamplePlayer", gamesPlayed: 0, gamesWon: 0, gamesLost: 0)
    }
}