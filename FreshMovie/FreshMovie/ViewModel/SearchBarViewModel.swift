import Foundation

@MainActor
class SearchBarViewModel: ObservableObject {
    @Published var searchText = "" {
        didSet {
            search()
        }
    }

    @Published var movies: [BasicMovie] = []
    @Published var isLoading = false
    @Published var searchMode: SearchMode = .movie

    func search() {
        guard !searchText.isEmpty else {
            movies = []
            return
        }

        isLoading = true

        Task {
            do {
                let response: MovieSearchResponse = try await fetchMovies(query: searchText)
                movies = response.results
                isLoading = false
            } catch {
                isLoading = false
                print("Error fetching movies: \(error)")
            }
        }
    }

    private func fetchMovies(query: String) async throws -> MovieSearchResponse {
        switch searchMode {
        case .movie:
            try await NetworkService.shared.request(endpoint: .getSearchMovies(query: query))
        }
    }
}

enum SearchMode {
    case movie
}
