import Foundation

extension DetailedMovie {
    enum CodingKeys: String, CodingKey {
        case adult
        case budget
        case genres
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case title
        case overview
        case popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case runTime = "runtime"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case revenue
        case status
        case tagline
        case voteAverage = "vote_average"
    }
}
