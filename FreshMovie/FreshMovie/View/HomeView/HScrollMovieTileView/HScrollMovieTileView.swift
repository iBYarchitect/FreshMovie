import SwiftUI

struct HScrollMovieTileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text(title)
                        .font(.system(size: 20))
                        .bold()

                    Spacer()

                    NavigationLink(destination: GridMovieView(movies: BasicMovie.Dummy.basicMovies, title: title)) {
                        Text("More")
                            .font(.system(size: 20))
                            .bold()
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
                    .padding()
                }
            }
            .frame(height: 400)
            .background(Color.App.grayLight)
        }
    }

    private let title = "Top 250"
}

#Preview {
    HScrollMovieTileView()
}
