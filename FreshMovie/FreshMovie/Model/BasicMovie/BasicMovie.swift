import Foundation

struct BasicMovie: Decodable, Equatable, Identifiable, Hashable {
    /// Indicates if the movie is for adults.
    let adult: Bool

    /// Genres associated with the movie.
    let genreIds: [Int]

    /// The unique identifier of the movie.
    let id: Int

    /// The original language of the movie.
    let originalLanguage: String

    /// A brief overview or synopsis of the movie.
    let overview: String

    /// The popularity score of the movie.
    let popularity: Double

    /// The path to the poster image of the movie. This can be combined with a base URL to form the full URL.
    let posterPath: String?

    /// The release date of the movie in the format "YYYY-MM-DD".
    var releaseDate: String

    /// The title of the movie.
    let title: String

    /// The average vote score of the movie.
    let voteAverage: Double
}
