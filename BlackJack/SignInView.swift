import SwiftUI

struct SignInView: View {
    @EnvironmentObject var playerManager: PlayerManager
    @State private var username: String = ""
    @State private var isCreatingNewPlayer = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In / Create Account")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if isCreatingNewPlayer {
                Button("Create New Player") {
                    playerManager.createNewPlayer(username: username)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                Button("Sign In") {
                    playerManager.signInPlayer(username: username)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button(isCreatingNewPlayer ? "Back to Sign In" : "Create New Account") {
                isCreatingNewPlayer.toggle()
            }
            .padding()
            .foregroundColor(.blue)
            
            Spacer()
        }
        .padding()
    }
}