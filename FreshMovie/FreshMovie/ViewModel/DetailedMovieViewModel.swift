import Foundation

final class DetailedMovieViewModel: ObservableObject {
    @Published var movie: DetailedMovie?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let movieID: Int

    init(movieID: Int) {
        self.movieID = movieID
    }

    @MainActor func fetchMovieDetails() async {
        isLoading = true
        errorMessage = nil

        do {
            let movie = try await NetworkService.shared.fetchMovieDetails(movieID: movieID)
            self.movie = movie
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
