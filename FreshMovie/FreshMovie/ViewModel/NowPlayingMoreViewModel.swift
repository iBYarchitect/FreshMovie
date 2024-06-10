import Foundation

@MainActor
class NowPlayingMoreViewModel: ObservableObject {
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
                    endpoint: .getNowPlaying,
                    page: currentPage
                )
                let updatedMovies = response.results.map { movie -> BasicMovie in
                    var updatedMovie = movie
                    updatedMovie.releaseDate = extractYear(from: movie.releaseDate)
                    return updatedMovie
                }
                if currentPage == 1 {
                    movies = updatedMovies
                } else {
                    movies.append(contentsOf: updatedMovies)
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

    private func extractYear(from dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return dateString }

        formatter.dateFormat = "yyyy"
        return formatter.string(from: date)
    }
}
