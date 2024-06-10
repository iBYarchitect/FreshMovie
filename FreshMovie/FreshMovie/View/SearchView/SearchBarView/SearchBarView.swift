import SwiftUI

struct SearchBarView: View {
    var body: some View {
        NavigationSplitView {
            VStack {
                TextField(
                    "Search for \(viewModel.searchMode == .movie ? "movies" : "items")...",
                    text: $viewModel.searchText
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .submitLabel(.go)
                .onSubmit {
                    viewModel.search()
                }

                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.movies, id: \.self, selection: $selectedMovie) { movie in
                        MovieCellView(movie: movie)
                            .listRowInsets(EdgeInsets())
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                }
            }
        } detail: {
            if let selectedMovie {
                DetailedMovieView(movieID: selectedMovie.id)
            } else {
                Text("Pick a movie")
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = SearchBarViewModel()
    @State private var selectedMovie: BasicMovie?
}

#Preview {
    SearchBarView()
}
