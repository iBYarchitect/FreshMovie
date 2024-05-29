import SwiftUI

struct GridMovieView: View {
    let movies: [BasicMovie]
    let title: String

    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(movies) { movie in
                    NavigationLink(destination: DetailedMovieView()) {
                        MovieGridCellView(movie: movie)
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(title)
    }
}

#Preview {
    GridMovieView(movies: BasicMovie.Dummy.basicMovies, title: "top 250")
}
