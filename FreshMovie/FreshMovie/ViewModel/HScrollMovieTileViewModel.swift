import Foundation

@MainActor
final class HScrollMovieTileViewModel: ObservableObject {
    @Published var movies: [BasicMovie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchTopRatedMovies() async {
        isLoading = true
        do {
            movies = try await NetworkService.shared.fetchMovies(endpoint: .getTopRated)
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = "Failed to load movies: \(error.localizedDescription)"
        }
    }
}
