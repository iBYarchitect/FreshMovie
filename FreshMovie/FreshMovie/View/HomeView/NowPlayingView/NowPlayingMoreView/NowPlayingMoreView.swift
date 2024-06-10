import SwiftUI

struct NowPlayingMoreView: View {
    let title: String

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: DetailedMovieView(movieID: movie.id)) {
                        MovieCellView(movie: movie)
                    }
                    .onAppear {
                        viewModel.loadNextPageIfNeeded(currentItem: movie)
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(title)
        .onAppear {
            viewModel.loadMovies()
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = NowPlayingMoreViewModel()
    @State private var selectedMovie: BasicMovie?
}

#Preview {
    NowPlayingMoreView(title: "Now playing")
}
