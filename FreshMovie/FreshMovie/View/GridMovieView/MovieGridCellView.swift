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
                    .lineLimit(2)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.5))
                    .padding([.leading, .trailing, .bottom], 5)
            }
        }
    }
}

#Preview {
    MovieGridCellView(movie: BasicMovie.Dummy.parasite)
}
