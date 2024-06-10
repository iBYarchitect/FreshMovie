import SwiftUI

struct NowPlayingView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text(title)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.heading.size,
                            weight: .heavy
                        )
                    )

                Text(viewModel.dateRange)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.body.size
                        )
                    )

                Spacer()

                NavigationLink(destination: NowPlayingMoreView(title: title)) {
                    Text(moreTitle)
                        .font(
                            .system(
                                size: AppStyle.FontStyle.heading.size,
                                weight: .heavy
                            )
                        )
                }
            }
            .padding()

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
                await viewModel.fetchNowPlayingMovies()
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = NowPlayingViewModel()

    private let title = "Now Playing"
    private let moreTitle = "More"
    private let scrollBlockHeight: CGFloat = 400
}

#Preview {
    NowPlayingView()
}
