import SwiftUI
import XCTest

final class AppColorTests: XCTestCase {
    func testColorAppEnumReturnsCorrectValuesForAppColorScheme() {
        let grayLight = Color(red: 239 / 255, green: 239 / 255, blue: 239 / 255)
        let grayDark = Color(red: 126 / 255, green: 126 / 255, blue: 126 / 255)

        XCTAssertEqual(grayLight, Color.App.grayLight)
        XCTAssertEqual(grayDark, Color.App.grayDark)
    }
}
