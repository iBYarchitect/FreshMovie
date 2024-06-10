import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(homeTabLabel, systemImage: .IconName.homeTab)
                }

            SearchView()
                .tabItem {
                    Label(searchTabLabel, systemImage: .IconName.searchTab)
                }

            ProfileView()
                .tabItem {
                    Label(profileTabLabel, systemImage: .IconName.userProfileTab)
                }
        }
    }

    // MARK: - Private interface

    private let homeTabLabel = "Home"
    private let searchTabLabel = "Search"
    private let profileTabLabel = "Profile"
}

#Preview {
    MainTabView()
}
