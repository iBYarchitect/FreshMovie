import XCTest

final class StringIconNameTests: XCTestCase {
    func testAllIconNamesReturnCorrectValues() {
        let homeTab = "house.fill"
        let searchTab = "magnifyingglass"
        let userProfileTab = "person.crop.circle"
        let filledStar = "star.fill"

        XCTAssertEqual(homeTab, String.IconName.homeTab)
        XCTAssertEqual(searchTab, String.IconName.searchTab)
        XCTAssertEqual(userProfileTab, String.IconName.userProfileTab)
        XCTAssertEqual(filledStar, String.IconName.filledStar)
    }
}
