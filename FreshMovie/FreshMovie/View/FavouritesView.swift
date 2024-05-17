import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationView {
            Text("Favourites view")
                .navigationTitle("Favourites view")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavouritesView()
}
