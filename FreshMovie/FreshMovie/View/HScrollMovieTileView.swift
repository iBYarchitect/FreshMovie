import SwiftUI

struct HScrollMovieTileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Top 250")
                        .font(.system(size: 20))
                        .bold()

                    Spacer()

                    Text("More")
                        .font(.system(size: 20))
                        .bold()
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
                    .padding()
                }
            }
            .frame(height: 400)
            .background(Color.App.grayLight)
        }
    }
}

#Preview {
    HScrollMovieTileView()
}
