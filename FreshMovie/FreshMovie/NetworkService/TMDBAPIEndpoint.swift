import Alamofire
import Foundation

extension TMDBAPI {
    static var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/") else {
            fatalError("Invalid base URL")
        }
        return url
    }

    var url: URL {
        switch self {
        case .getTopRated:
            return TMDBAPI.baseURL.appending(path: TMDBAPI.Path.topRated)
        case let .getMovieDetails(movieID):
            return TMDBAPI.baseURL.appending(path: "\(TMDBAPI.Path.movieDetails)\(movieID)")
        case .getSearchMovies:
            return TMDBAPI.baseURL.appending(path: TMDBAPI.Path.searchMovies)
        case .getNowPlaying:
            return TMDBAPI.baseURL.appending(path: TMDBAPI.Path.nowPlaying)
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getTopRated,
             .getMovieDetails,
             .getSearchMovies,
             .getNowPlaying:
            .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getTopRated,
             .getMovieDetails,
             .getNowPlaying:
            return nil
        case let .getSearchMovies(query):
            return ["query": query]
        }
    }

    var headers: HTTPHeaders {
        ["Authorization": TMDBAPI.key]
    }

    // MARK: - Private interface

    // swiftlint:disable:next line_length
    private static let key = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMWZlNmViMjA1MGRkODY3N2JjOTBhZjcwNDc3MDllZiIsInN1YiI6IjY2MmUwNDY3YTE5OWE2MDEyYjcyODFlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MhMmZtagJoI5qkYg1w-rrkqEOyv70IzJYmJgfFI7BLo"
}
