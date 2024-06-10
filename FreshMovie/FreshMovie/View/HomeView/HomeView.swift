import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TopRatedMoviesView()

                    NowPlayingView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
