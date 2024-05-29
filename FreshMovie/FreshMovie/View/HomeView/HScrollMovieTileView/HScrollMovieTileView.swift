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

                    NavigationLink(destination: GridMovieView(movies: BasicMovie.Dummy.basicMovies, title: title)) {
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

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(BasicMovie.Dummy.basicMovies) { movie in
                            NavigationLink(destination: DetailedMovieView()) {
                                MovieMiniatureView(movie: movie)
                            }
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                }
            }
            .frame(height: scrollBlockHeight)
            .background(Color.App.grayLight)
        }
    }

    // MARK: - Private interface

    private let title = "Top 250"
    private let moreTitle = "More"
    private let scrollBlockHeight: CGFloat = 400
}

#Preview {
    HScrollMovieTileView()
}
