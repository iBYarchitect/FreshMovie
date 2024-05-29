import Foundation

extension BasicMovie {
    enum Dummy {
        static let shawshankRedemption = BasicMovie(
            adult: false,
            genreIds: [18, 80],
            id: 278,
            originalLanguage: "en",
            overview: """
            Imprisoned in the 1940s for the double murder of his wife and her lover,
            upstanding banker Andy Dufresne begins a new life at the Shawshank prison,
            where he puts his accounting skills to work for an amoral warden.
            During his long stretch in prison, Dufresne comes to be admired by the other inmates
            -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.
            """,
            popularity: 123.586,
            posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
            releaseDate: "1994-09-23",
            title: "The Shawshank Redemption",
            voteAverage: 8.705
        )

        static let godfather = BasicMovie(
            adult: false,
            genreIds: [18, 80],
            id: 238,
            originalLanguage: "en",
            overview: """
            Spanning the years 1945 to 1955, a chronicle of the fictional
            Italian-American Corleone crime family. When organized crime family patriarch,
            Vito Corleone barely survives an attempt on his life, his youngest son,
            Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.
            """,
            popularity: 148.891,
            posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            releaseDate: "1972-03-14",
            title: "The Godfather",
            voteAverage: 8.695
        )

        static let godfatherPartII = BasicMovie(
            adult: false,
            genreIds: [18, 80],
            id: 240,
            originalLanguage: "en",
            overview: """
            In the continuing saga of the Corleone crime family, a young Vito Corleone
            grows up in Sicily and in 1910s New York. In the 1950s,
            Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.
            """,
            popularity: 152.722,
            posterPath: "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
            releaseDate: "1974-12-20",
            title: "The Godfather Part II",
            voteAverage: 8.6
        )

        static let schindlersList = BasicMovie(
            adult: false,
            genreIds: [18, 36, 10752],
            id: 424,
            originalLanguage: "en",
            overview: """
            The true story of how businessman Oskar Schindler saved over a thousand Jewish lives
            from the Nazis while they worked as slaves in his factory during World War II.
            """,
            popularity: 76.924,
            posterPath: "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
            releaseDate: "1993-12-15",
            title: "Schindler's List",
            voteAverage: 8.6
        )

        static let angryMen12 = BasicMovie(
            adult: false,
            genreIds: [18],
            id: 389,
            originalLanguage: "en",
            overview: """
            The defense and the prosecution have rested and the jury is filing into the jury room
            to decide if a young Spanish-American is guilty or innocent of murdering his father.
            What begins as an open and shut case soon becomes a mini-drama of each of the jurors'
            prejudices and preconceptions about the trial, the accused, and each other.
            """,
            popularity: 72.1,
            posterPath: "/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg",
            releaseDate: "1957-04-10",
            title: "12 Angry Men",
            voteAverage: 8.541
        )

        static let dilwaleDulhania = BasicMovie(
            adult: false,
            genreIds: [35, 18, 10749],
            id: 19404,
            originalLanguage: "hi",
            overview: """
            Raj is a rich, carefree, happy-go-lucky second generation NRI.
            Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI
            is very strict about adherence to Indian values. Simran has left for India
            to be married to her childhood fiancé. Raj leaves for India with a mission at his hands,
            to claim his lady love under the noses of her whole family. Thus begins a saga.
            """,
            popularity: 36.56,
            posterPath: "/lfRkUr7DYdHldAqi3PwdQGBRBPM.jpg",
            releaseDate: "1995-10-20",
            title: "Dilwale Dulhania Le Jayenge",
            voteAverage: 8.538
        )

        static let spiritedAway = BasicMovie(
            adult: false,
            genreIds: [16, 10751, 14],
            id: 129,
            originalLanguage: "ja",
            overview: """
            A young girl, Chihiro, becomes trapped in a strange new world of spirits.
            When her parents undergo a mysterious transformation, she
            must call upon the courage she never knew she had to free her family.
            """,
            popularity: 101.414,
            posterPath: "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
            releaseDate: "2001-07-20",
            title: "Spirited Away",
            voteAverage: 8.536
        )

        static let darkKnight = BasicMovie(
            adult: false,
            genreIds: [18, 28, 80, 53],
            id: 155,
            originalLanguage: "en",
            overview: """
            Batman raises the stakes in his war on crime.
            With the help of Lt. Jim Gordon and District Attorney Harvey Dent,
            Batman sets out to dismantle the remaining criminal organizations that plague the streets.
            The partnership proves to be effective, but they soon find themselves prey to a reign
            of chaos unleashed by a rising criminal mastermind known to the terrified
            citizens of Gotham as the Joker.
            """,
            popularity: 97.679,
            posterPath: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
            releaseDate: "2008-07-16",
            title: "The Dark Knight",
            voteAverage: 8.515
        )

        static let parasite = BasicMovie(
            adult: false,
            genreIds: [35, 53, 18],
            id: 496_243,
            originalLanguage: "ko",
            overview: """
            All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks
            for their livelihood until they get entangled in an unexpected incident.
            """,
            popularity: 79.751,
            posterPath: "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
            releaseDate: "2019-05-30",
            title: "Parasite",
            voteAverage: 8.509
        )

        static let basicMovies: [BasicMovie] = [
            shawshankRedemption,
            godfather,
            godfatherPartII,
            schindlersList,
            angryMen12,
            dilwaleDulhania,
            spiritedAway,
            darkKnight,
            parasite,
        ]
    }
}
