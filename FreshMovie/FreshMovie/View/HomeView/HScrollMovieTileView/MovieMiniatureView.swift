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
                    .font(.system(size: 12))

                Text("")

                Text(movie.title)
                    .font(.system(size: 12))
                    .lineLimit(1)
            }
            .padding()
        }
        .frame(width: 125)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
    }
}

#Preview {
    MovieMiniatureView(movie: BasicMovie.Dummy.parasite)
}
