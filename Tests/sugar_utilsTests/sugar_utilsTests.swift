import XCTest
@testable import sugar_utils

final class sugar_utilsTests: XCTestCase {
    func testPresetName() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(getPresetName(insulinScalePercent: 20, targetBase: 50), "I: 20% T: 50")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
