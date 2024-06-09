import SwiftUI

struct MovieSearchCellView: View {
    let movie: BasicMovie

    var body: some View {
        HStack {
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
                Divider()

                Spacer()

                Text(movie.title)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.body.size
                        )
                    )

                Text(movie.releaseDate)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.body.size
                        )
                    )
                    .lineLimit(1)

                Spacer()

                Divider()
            }

            Spacer()
        }
        .frame(height: cardHeight)
        .background(Color.white)
    }

    // MARK: - Private interface

    private let cardHeight: CGFloat = 100
}

#Preview {
    MovieSearchCellView(movie: BasicMovie.Dummy.godfather)
}
