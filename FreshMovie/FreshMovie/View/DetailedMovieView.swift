import SwiftUI

struct DetailedMovieView: View {
    /// Initializes a new instance of `DetailedMovieView` with the given movie ID.
    ///
    /// - Parameter movieID: The unique identifier of the movie to be displayed in this view.
    ///
    /// This initializer creates an instance of `DetailedMovieViewModel` with the provided `movieID`
    /// and assigns it to the `_viewModel` property. This ensures that the view model is properly
    /// initialized and can be used to fetch and display detailed information about the specified movie.
    init(movieID: Int) {
        _viewModel = StateObject(wrappedValue: DetailedMovieViewModel(movieID: movieID))
    }

    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else if let movie = viewModel.movie {
                ZStack(alignment: .bottom) {
                    AsyncImage(
                        url: viewModel.backdropURL()
                    ) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fit)

                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(
                                .system(
                                    size: AppStyle.FontStyle.body.size
                                )
                            )
                            .foregroundStyle(Color.white)

                        HStack {
                            Text(movie.releaseDate)
                                .font(
                                    .system(
                                        size: AppStyle.FontStyle.body.size
                                    )
                                )
                                .foregroundColor(.white)

                            Text("   ")

                            Text("\(movie.runTime) \(minutes)")
                                .font(
                                    .system(
                                        size: AppStyle.FontStyle.body.size
                                    )
                                )
                                .foregroundColor(.white)

                            Spacer()
                        }
                    }
                    .padding()
                    .background {
                        Color.black.opacity(AppStyle.UIElementConstant.opacity)
                            .blur(radius: AppStyle.UIElementConstant.blurRadius)
                    }
                }
                .edgesIgnoringSafeArea(.all)

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(movie.genres, id: \.id) { genre in
                            Text(genre.name)
                                .padding()
                                .background(Color.App.grayDark)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
                        }
                    }
                    .padding()
                }

                VStack(alignment: .leading) {
                    HStack {
                        Text(overview)
                            .font(
                                .system(
                                    size: AppStyle.FontStyle.heading.size,
                                    weight: .bold
                                )
                            )

                        Spacer()
                    }

                    Text(movie.overview)
                }
                .padding()
                .background(Color.App.grayLight)

                HStack {
                    VStack(alignment: .leading) {
                        Text(boxOffice)
                            .font(
                                .system(
                                    size: AppStyle.FontStyle.heading.size,
                                    weight: .bold
                                )
                            )

                        Text("\(budget) \(movie.budget)")

                        Text("\(revenue) \(movie.revenue)")
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

                        Text("\(country) \(movie.originCountry.joined(separator: ", "))")
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
        .navigationTitle(viewModel.movie?.title ?? loadingTitle)
        .task {
            await viewModel.fetchMovieDetails()
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel: DetailedMovieViewModel

    private let overview = "Overview:"
    private let boxOffice = "Box office:"
    private let details = "Details:"
    private let production = "Production:"
    private let budget = "Budget:"
    private let revenue = "Revenue:"
    private let minutes = "min"
    private let country = "Country:"
    private let loadingTitle = "Loading..."
}

#Preview {
    DetailedMovieView(movieID: 278)
}
