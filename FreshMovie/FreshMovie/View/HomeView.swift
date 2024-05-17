import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home view")
                .navigationTitle("Home view")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
