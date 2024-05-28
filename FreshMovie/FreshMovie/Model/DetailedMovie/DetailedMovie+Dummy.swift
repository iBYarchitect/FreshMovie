import Foundation

extension DetailedMovie {
    enum Dummy {
        static let shawshankRedemption = DetailedMovie(
            adult: false,
            budget: 25_000_000,
            genres: [
                Genre(id: 18, name: "Drama"),
                Genre(id: 80, name: "Crime"),
            ],
            id: "278",
            originCountry: ["US"],
            originalLanguage: "en",
            title: "The Shawshank Redemption",
            overview: """
            Imprisoned in the 1940s for the double murder of his wife and her lover,
            upstanding banker Andy Dufresne begins a new life at the Shawshank prison,
            where he puts his accounting skills to work for an amoral warden.
            During his long stretch in prison, Dufresne comes to be admired by the other inmates --
            including an older prisoner named Red -- for his integrity and unquenchable sense of hope.
            """,
            popularity: 123.586,
            posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
            releaseDate: "1994-09-23",
            productionCompanies: [
                ProductionCompany(
                    id: 97,
                    logoPath: "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
                    name: "Castle Rock Entertainment",
                    originCountry: "US"
                ),
            ],
            productionCountries: [
                ProductionCountry(name: "United States of America"),
            ],
            revenue: 28_341_469,
            status: "Released",
            tagline: "Fear can hold you prisoner. Hope can set you free.",
            voteAverage: 8.705
        )

        static let godFather = DetailedMovie(
            adult: false,
            budget: 6_000_000,
            genres: [
                Genre(id: 18, name: "Drama"),
                Genre(id: 80, name: "Crime"),
            ],
            id: "238",
            originCountry: ["US"],
            originalLanguage: "en",
            title: "The Godfather",
            overview: """
            Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.
            When organized crime family patriarch, Vito Corleone barely survives an attempt on his life,
            his youngest son, Michael steps in to take care of the would-be killers,
            launching a campaign of bloody revenge.
            """,
            popularity: 148.891,
            posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            releaseDate: "1972-03-14",
            productionCompanies: [
                ProductionCompany(
                    id: 4,
                    logoPath: "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
                    name: "Paramount",
                    originCountry: "US"
                ),
                ProductionCompany(
                    id: 10211,
                    logoPath: nil,
                    name: "Alfran Productions",
                    originCountry: "US"
                ),
                ProductionCompany(
                    id: 70,
                    logoPath: "/ueaENQkPcy8rlr5fGZVBXKOhlBh.png",
                    name: "American Zoetrope",
                    originCountry: "US"
                ),
            ],
            productionCountries: [
                ProductionCountry(name: "United States of America"),
            ],
            revenue: 245_066_411,
            status: "Released",
            tagline: "An offer you can't refuse.",
            voteAverage: 8.695
        )

        static let godFatherPartII = DetailedMovie(
            adult: false,
            budget: 13_000_000,
            genres: [
                Genre(id: 18, name: "Drama"),
                Genre(id: 80, name: "Crime"),
            ],
            id: "240",
            originCountry: ["US"],
            originalLanguage: "en",
            title: "The Godfather Part II",
            overview: """
            In the continuing saga of the Corleone crime family,
            a young Vito Corleone grows up in Sicily and in 1910s New York.
            In the 1950s, Michael Corleone attempts to expand the family business into
            Las Vegas, Hollywood and Cuba.
            """,
            popularity: 152.722,
            posterPath: "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
            releaseDate: "1974-12-20",
            productionCompanies: [
                ProductionCompany(
                    id: 4,
                    logoPath: "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
                    name: "Paramount",
                    originCountry: "US"
                ),
                ProductionCompany(
                    id: 536,
                    logoPath: nil,
                    name: "The Coppola Company",
                    originCountry: "US"
                ),
                ProductionCompany(
                    id: 70,
                    logoPath: "/ueaENQkPcy8rlr5fGZVBXKOhlBh.png",
                    name: "American Zoetrope",
                    originCountry: "US"
                ),
            ],
            productionCountries: [
                ProductionCountry(name: "United States of America"),
            ],
            revenue: 102_600_000,
            status: "Released",
            tagline: "The rise and fall of the Corleone empire.",
            voteAverage: 8.6
        )

        static let schindlersList = DetailedMovie(
            adult: false,
            budget: 22_000_000,
            genres: [
                Genre(id: 18, name: "Drama"),
                Genre(id: 36, name: "History"),
                Genre(id: 10752, name: "War"),
            ],
            id: "424",
            originCountry: ["US"],
            originalLanguage: "en",
            title: "Schindler's List",
            overview: """
            The true story of how businessman Oskar Schindler saved
            over a thousand Jewish lives from the Nazis while they worked
            as slaves in his factory during World War II.
            """,
            popularity: 76.924,
            posterPath: "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
            releaseDate: "1993-12-15",
            productionCompanies: [
                ProductionCompany(
                    id: 56,
                    logoPath: "/cEaxANEisCqeEoRvODv2dO1I0iI.png",
                    name: "Amblin Entertainment",
                    originCountry: "US"
                ),
            ],
            productionCountries: [
                ProductionCountry(name: "United States of America"),
            ],
            revenue: 321_365_567,
            status: "Released",
            tagline: "Whoever saves one life, saves the world entire.",
            voteAverage: 8.6
        )
    }
}
