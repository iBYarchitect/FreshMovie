import Foundation

@MainActor
class GridMovieViewModel: ObservableObject {
    @Published var movies: [BasicMovie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private var currentPage = 1
    private var totalPages = 1

    func loadMovies() {
        guard !isLoading else { return }
        isLoading = true

        Task {
            do {
                let response: TopRatedResponse = try await NetworkService.shared.request(
                    endpoint: .getTopRated,
                    page: currentPage
                )
                if currentPage == 1 {
                    movies = response.results
                } else {
                    movies.append(contentsOf: response.results)
                }
                currentPage += 1
                totalPages = response.totalPages
                isLoading = false
            } catch {
                errorMessage = "Failed to load movies: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }

    func loadNextPageIfNeeded(currentItem movie: BasicMovie?) {
        guard let movie, !isLoading, movies.count > 5 else { return }

        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
        if let index = movies.firstIndex(where: { $0.id == movie.id }), index >= thresholdIndex {
            loadMovies()
        }
    }
}
