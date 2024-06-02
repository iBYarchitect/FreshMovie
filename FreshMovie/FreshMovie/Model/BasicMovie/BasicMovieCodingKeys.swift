import Foundation

extension BasicMovie {
    enum CodingKeys: String, CodingKey {
        case adult
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
