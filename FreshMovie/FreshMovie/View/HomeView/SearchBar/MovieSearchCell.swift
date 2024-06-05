import SwiftUI

struct MovieSearchCell: View {
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
                Text(movie.title)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.footnote.size
                        )
                    )
                    .lineLimit(1)

                Text(movie.releaseDate)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.footnote.size
                        )
                    )
                    .lineLimit(1)

                HStack {
                    ForEach(movie.genreIds, id: \.id) { genre in
                        Text(genre.name)
                            .padding()
                            .background(Color.App.grayDark)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
                    }
                }
                .padding()
            }
            .padding()
        }
        .frame(height: cardWidth)
        .background(Color.white)
//        .clipShape(RoundedRectangle(cornerRadius: cardCornerRadius))
//        .shadow(radius: shadowRadius)
    }

    // MARK: - Private interface

    private let cardWidth: CGFloat = 125
    private let cardCornerRadius: CGFloat = 10
    private let shadowRadius: CGFloat = 5
}

#Preview {
    MovieSearchCell(movie: BasicMovie.Dummy.godfather)
}
