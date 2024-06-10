import Foundation

@MainActor
final class TopRatedMoviesViewModel: ObservableObject {
    @Published var movies: [BasicMovie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchTopRatedMovies() async {
        isLoading = true
        do {
            let response: TopRatedResponse = try await NetworkService.shared.request(endpoint: .getTopRated)
            movies = response.results
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = "Failed to load movies: \(error.localizedDescription)"
        }
    }
}
