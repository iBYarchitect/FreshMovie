import SwiftUI

struct TopRatedMoviesView: View {
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.heading.size,
                            weight: .heavy
                        )
                    )

                Spacer()

                NavigationLink(destination: GridMovieView(title: title)) {
                    Text(moreTitle)
                        .font(
                            .system(
                                size: AppStyle.FontStyle.heading.size,
                                weight: .heavy
                            )
                        )
                }
            }
            .padding(.horizontal)

            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                ScrollView(.horizontal) {
                    HStack(spacing: AppStyle.UIElementConstant.horizontalSpacing) {
                        ForEach(viewModel.movies) { movie in
                            NavigationLink(destination: DetailedMovieView(movieID: movie.id)) {
                                MovieMiniatureView(movie: movie)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .frame(height: scrollBlockHeight)
        .background(Color.App.grayLight)
        .onAppear {
            Task {
                await viewModel.fetchTopRatedMovies()
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = TopRatedMoviesViewModel()

    private let title = "Top 250"
    private let moreTitle = "More"
    private let scrollBlockHeight: CGFloat = 400
}

#Preview {
    TopRatedMoviesView()
}
