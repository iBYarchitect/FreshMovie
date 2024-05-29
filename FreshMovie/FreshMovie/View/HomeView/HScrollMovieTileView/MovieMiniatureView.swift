import SwiftUI

struct MovieMiniatureView: View {
    let movie: BasicMovie

    var body: some View {
        VStack(alignment: .leading) {
            Image("shawshankRedemptionPoster")
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .leading) {
                Text("\(movie.voteAverage)")
                    .font(
                        .system(
                            size: AppStyle.FontStyle.footnote.size
                        )
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
