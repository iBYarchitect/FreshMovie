import SwiftUI

struct GridMovieView: View {
    @StateObject private var viewModel = GridMovieViewModel()
    let title: String

    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: DetailedMovieView()) {
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
}

#Preview {
    GridMovieView(title: "Top 250")
}
