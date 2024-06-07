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
            let movie: DetailedMovie = try await NetworkService.shared.request(
                endpoint: .getMovieDetails(
                    movieID: movieID
                )
            )
            self.movie = movie
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    func backdropURL() -> URL? {
        guard let backdropPath = movie?.backdropPath else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")
    }
}
