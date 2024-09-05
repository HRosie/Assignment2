import SwiftUI

struct HowToPlaySheetView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("How to Play Blackjack")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)
            
            Text("Objective:")
                .font(.title2)
                .bold()
            Text("The goal of Blackjack is to beat the dealer's hand without going over 21. You win by having a hand value closer to 21 than the dealer without busting.")
            
            Text("Card Values:")
                .font(.title2)
                .bold()
            Text("• Number cards (2-10) are worth their face value.")
            Text("• Face cards (Jack, Queen, King) are each worth 10 points.")
            Text("• Aces can be worth either 1 or 11 points, depending on which value benefits your hand more.")
            
            Text("Gameplay:")
                .font(.title2)
                .bold()
            Text("1. At the start of the game, both you and the dealer are dealt two cards. One of the dealer's cards is hidden.")
            Text("2. You can choose to 'Hit' to draw another card or 'Stand' to keep your current hand.")
            Text("3. If your hand value exceeds 21, you bust and lose the game.")
            Text("4. If you choose to 'Stand', the dealer reveals their hidden card and draws cards until they reach at least 17.")
            
            Text("Winning and Losing:")
                .font(.title2)
                .bold()
            Text("• If your hand value is closer to 21 than the dealer's hand, you win.")
            Text("• If the dealer busts (exceeds 21), you win.")
            Text("• If you bust, you lose.")
            Text("• If both you and the dealer have the same hand value, it is a tie (push).")
            
            Text("Blackjack:")
                .font(.title2)
                .bold()
            Text("• A 'Blackjack' is when your initial two cards are an Ace and a 10-point card (10, Jack, Queen, or King).")
            Text("• A Blackjack usually pays out at a higher rate than a regular win.")
            
            Spacer()
        }
        .padding()
    }
}