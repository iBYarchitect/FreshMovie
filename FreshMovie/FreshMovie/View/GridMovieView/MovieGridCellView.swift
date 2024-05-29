import SwiftUI

struct MovieGridCellView: View {
    let movie: BasicMovie

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                Image("shawshankRedemptionPoster")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text(movie.title)
                    .lineLimit(lineLimitGridCell)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.body.size,
                            weight: .light
                        )
                    )
                    .foregroundColor(.white)
                    .background(Color.black.opacity(gridCellOpacity))
                    .padding()
            }
        }
    }

    // MARK: - Private interface

    private let lineLimitGridCell = 2
    private let gridCellOpacity = 0.5
}

#Preview {
    MovieGridCellView(movie: BasicMovie.Dummy.parasite)
}
