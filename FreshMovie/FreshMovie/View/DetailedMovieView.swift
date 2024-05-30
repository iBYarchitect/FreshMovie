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
                Text(overview)
                    .font(.system(size: 20))
                    .bold()

                Text(DetailedMovie.Dummy.shawshankRedemption.overview)
            }
            .padding()
            .background(Color.App.grayLight)

            HStack {
                VStack(alignment: .leading) {
                    Text(boxOffice)
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
                    Text(details)
                        .font(.system(size: 20))
                        .bold()

                    Text("Country: \(DetailedMovie.Dummy.shawshankRedemption.originCountry.joined(separator: ", "))")
                    VStack(alignment: .leading) {
                        Text(production)
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

    // MARK: - Private interface

    private let overview = "Overview:"
    private let boxOffice = "Box office:"
    private let details = "Details:"
    private let production = "Production:"
}

#Preview {
    DetailedMovieView()
}
