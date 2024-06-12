import XCTest

final class UIElementConstantTests: XCTestCase {
    func testAllUIElementsSizesReturnCorrectValues() {
        let cornerRadius = 10.0
        let blurRadius = 10.0
        let opacity = 0.5
        let horizontalSpacing = 10.0

        XCTAssertEqual(cornerRadius, AppStyle.UIElementConstant.cornerRadius)
        XCTAssertEqual(blurRadius, AppStyle.UIElementConstant.blurRadius)
        XCTAssertEqual(opacity, AppStyle.UIElementConstant.opacity)
        XCTAssertEqual(horizontalSpacing, AppStyle.UIElementConstant.horizontalSpacing)
    }
}
