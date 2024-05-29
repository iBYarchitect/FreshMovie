import SwiftUI

struct DetailedMovieView: View {
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                Image("shawshankBackDrop")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                VStack(alignment: .leading) {
                    Text(DetailedMovie.Dummy.shawshankRedemption.title)
                        .font(.system(size: 20))
                        .foregroundColor(.white)

                    HStack {
                        Text(DetailedMovie.Dummy.shawshankRedemption.releaseDate)
                            .foregroundColor(.white)

                        Text("   ")

                        Text("\(DetailedMovie.Dummy.shawshankRedemption.runTime) min")
                            .foregroundColor(.white)

                        Spacer()
                    }
                }
                .padding()
                .background(
                    Color.black.opacity(0.5)
                        .blur(radius: 10)
                )
            }
            .edgesIgnoringSafeArea(.all)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(DetailedMovie.Dummy.shawshankRedemption.genres, id: \.id) { genre in
                        Text(genre.name)
                            .padding()
                            .background(Color.App.grayDark)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding()
            }

            VStack(alignment: .leading) {
                Text("Overview:")
                    .font(.system(size: 20))
                    .bold()

                Text(DetailedMovie.Dummy.shawshankRedemption.overview)
            }
            .padding()
            .background(Color.App.grayLight)

            HStack {
                VStack(alignment: .leading) {
                    Text("Box office:")
                        .font(.system(size: 20))
                        .bold()

                    Text("Budget: \(DetailedMovie.Dummy.shawshankRedemption.budget)")

                    Text("Revenue: \(DetailedMovie.Dummy.shawshankRedemption.revenue)")
                }

                Spacer()
            }
            .padding()
            .background(Color.App.grayLight)

            HStack {
                VStack(alignment: .leading) {
                    Text("Details:")
                        .font(.system(size: 20))
                        .bold()

                    Text("Country: \(DetailedMovie.Dummy.shawshankRedemption.originCountry.joined(separator: ", "))")
                    VStack(alignment: .leading) {
                        Text("Production:")
                        ForEach(DetailedMovie.Dummy.shawshankRedemption.productionCompanies) { company in
                            Text("\(company.name) (\(company.originCountry))")
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .background(Color.App.grayLight)
        }
        .navigationTitle(DetailedMovie.Dummy.shawshankRedemption.title)
    }
}

#Preview {
    DetailedMovieView()
}
