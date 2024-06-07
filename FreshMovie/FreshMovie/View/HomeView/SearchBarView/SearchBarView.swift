import SwiftUI

struct SearchBarView: View {
    var body: some View {
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
                List(viewModel.movies) { movie in
                    MovieSearchCell(movie: movie)
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }
        }
        .navigationTitle("Movie Search")
    }

    @StateObject private var viewModel = SearchBarViewModel()
}

#Preview {
    SearchBarView()
}
