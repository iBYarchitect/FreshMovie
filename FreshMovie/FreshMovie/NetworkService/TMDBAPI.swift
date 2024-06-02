import Foundation

enum TMDBAPI {
    case getTopRated
    case getMovieDetails(movieID: Int)

    enum Path {
        static let topRated = "3/movie/top_rated"
        static let movieDetails = "3/movie/"
    }
}
