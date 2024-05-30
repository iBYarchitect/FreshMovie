import SwiftUI

struct HScrollMovieTileView: View {
    var body: some View {
        NavigationStack {
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

                    NavigationLink(destination: GridMovieView(movies: viewModel.movies, title: title)) {
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
                        HStack(spacing: 10) {
                            ForEach(viewModel.movies) { movie in
                                NavigationLink(destination: DetailedMovieView()) {
                                    MovieMiniatureView(movie: movie)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .frame(height: 400)
            .background(Color.gray.opacity(0.2))
        }
        .onAppear {
            Task {
                await viewModel.fetchTopRatedMovies()
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = HScrollMovieTileViewModel()

    private let title = "Top 250"
    private let moreTitle = "More"
    private let scrollBlockHeight: CGFloat = 400
}

#Preview {
    HScrollMovieTileView()
}
