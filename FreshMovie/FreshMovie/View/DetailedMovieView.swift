import SwiftUI

struct DetailedMovieView: View {
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else if let movie = viewModel.movie {
                ZStack(alignment: .bottom) {
                    AsyncImage(
                        url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdropPath ?? "")")
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fit)

                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.system(size: 20))
                            .foregroundColor(.white)

                        HStack {
                            Text(movie.releaseDate)
                                .foregroundColor(.white)

                            Text("   ")

                            Text("\(movie.runTime) min")
                                .foregroundColor(.white)

                            Spacer()
                        }
                    }
                    .padding()
                    .background(
                        Color.black.opacity(0.5)
                            .blur(radius: 10)
                    )
                }
                .edgesIgnoringSafeArea(.all)

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(movie.genres, id: \.id) { genre in
                            Text(genre.name)
                                .padding()
                                .background(Color.App.grayDark)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .padding()
                }

                VStack(alignment: .leading) {
                    Text(overview)
                        .font(.system(size: 20))
                        .bold()

                    Text(movie.overview)
                }
                .padding()
                .background(Color.App.grayLight)

                HStack {
                    VStack(alignment: .leading) {
                        Text(boxOffice)
                            .font(.system(size: 20))
                            .bold()

                        Text("Budget: \(movie.budget)")

                        Text("Revenue: \(movie.revenue)")
                    }

                    Spacer()
                }
                .padding()
                .background(Color.App.grayLight)

                HStack {
                    VStack(alignment: .leading) {
                        Text(details)
                            .font(.system(size: 20))
                            .bold()

                        Text("Country: \(movie.originCountry.joined(separator: ", "))")
                        VStack(alignment: .leading) {
                            Text(production)
                            ForEach(movie.productionCompanies) { company in
                                Text("\(company.name) (\(company.originCountry))")
                            }
                        }
                    }

                    Spacer()
                }
                .padding()
                .background(Color.App.grayLight)
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
        }
        .navigationTitle(viewModel.movie?.title ?? "Loading...")
        .task {
            await viewModel.fetchMovieDetails()
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel: DetailedMovieViewModel

    init(movieID: Int) {
        _viewModel = StateObject(wrappedValue: DetailedMovieViewModel(movieID: movieID))
    }

    private let overview = "Overview:"
    private let boxOffice = "Box office:"
    private let details = "Details:"
    private let production = "Production:"
}

#Preview {
    DetailedMovieView(movieID: 278)
}
