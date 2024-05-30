import Foundation

enum TMDBAPI {
    case getTopRated

    enum Path {
        static let topRated = "3/movie/top_rated"
    }
}
