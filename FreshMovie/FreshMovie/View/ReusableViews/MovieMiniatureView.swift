import SwiftUI

struct MovieMiniatureView: View {
    let movie: BasicMovie

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(
                url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")
            ) { image in
                image
                    .resizable()
            } placeholder: {
                Color.gray
            }
            .aspectRatio(contentMode: .fit)

            VStack(alignment: .leading) {
                StarRatingView(
                    rating: movie.voteAverage,
                    size: AppStyle.FontStyle.footnote.size
                )

                Text("")

                Text(movie.title)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.footnote.size
                        )
                    )
                    .lineLimit(1)
            }
            .padding()
        }
        .frame(width: cardWidth)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: cardCornerRadius))
        .shadow(radius: shadowRadius)
    }

    // MARK: - Private interface

    private let cardWidth: CGFloat = 125
    private let cardCornerRadius: CGFloat = 10
    private let shadowRadius: CGFloat = 5
}

#Preview {
    MovieMiniatureView(movie: BasicMovie.Dummy.parasite)
}
