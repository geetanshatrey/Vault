import SwiftUI

struct ContentView: View {
    var body: some View {
        VaultListView().updateOtpData()
        return OpeningSplashScreen()
    }
}
