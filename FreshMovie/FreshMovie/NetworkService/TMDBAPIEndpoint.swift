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
            TMDBAPI.baseURL.appendingPathComponent(TMDBAPI.Path.topRated)
        case let .getMovieDetails(movieID: movieID):
            TMDBAPI.baseURL.appendingPathComponent("\(TMDBAPI.Path.movieDetails)\(movieID)")
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getTopRated:
            .get
        case .getMovieDetails:
            .get
        }
    }

    var headers: HTTPHeaders {
        ["Authorization": TMDBAPI.key]
    }

    // MARK: - Private interface

    // swiftlint:disable:next line_length
    private static let key = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMWZlNmViMjA1MGRkODY3N2JjOTBhZjcwNDc3MDllZiIsInN1YiI6IjY2MmUwNDY3YTE5OWE2MDEyYjcyODFlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MhMmZtagJoI5qkYg1w-rrkqEOyv70IzJYmJgfFI7BLo"
}
