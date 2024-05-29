import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("Profile view")
                .navigationTitle("Profile view")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
