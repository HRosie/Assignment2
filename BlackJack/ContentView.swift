import SwiftUI

struct ContentView: View {
    @StateObject private var playerManager = PlayerManager()
    
    @State private var showingSignInView = false
    @State private var showHowToPlaySheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if playerManager.currentPlayer == nil {
                    Button("Sign In / Create Account") {
                        showingSignInView.toggle()
                    }
                    .font(.title)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } else {
                    Text("Welcome, \(playerManager.currentPlayer!.username)!")
                        .font(.largeTitle)
                        .bold()
                    
                    NavigationLink(destination: PlayView().environmentObject(playerManager)) {
                        Text("Play")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        showHowToPlaySheet.toggle()
                    }) {
                        Text("How to Play")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showHowToPlaySheet) {
                        HowToPlaySheetView()
                    }
                    
                    NavigationLink(destination: ScoreboardView().environmentObject(playerManager)) {
                        Text("Scoreboard")
                            .font(.title)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Menu")
        }
        .sheet(isPresented: $showingSignInView) {
            SignInView()
                .environmentObject(playerManager)
        }
    }
}