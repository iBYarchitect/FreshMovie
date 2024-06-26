import Foundation

enum TMDBAPI {
    case getTopRated
    case getMovieDetails(movieID: Int)
    case getSearchMovies(query: String)
    case getNowPlaying

    enum Path {
        static let topRated = "3/movie/top_rated"
        static let movieDetails = "3/movie/"
        static let searchMovies = "3/search/movie"
        static let nowPlaying = "3/movie/now_playing"
    }
}
