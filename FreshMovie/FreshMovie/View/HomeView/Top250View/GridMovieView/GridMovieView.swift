import SwiftUI

struct GridMovieView: View {
    let title: String

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: 0
            ) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: DetailedMovieView(movieID: movie.id)) {
                        MovieGridCellView(movie: movie)
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

    @StateObject private var viewModel = GridMovieViewModel()
    private let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
}

#Preview {
    GridMovieView(title: "Top 250")
}
