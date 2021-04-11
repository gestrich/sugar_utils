import XCTest
@testable import sugar_utils

final class sugar_utilsTests: XCTestCase {
    
    func testCreatePresets() {
        let allPresets = SUOverridePreset.createDefaultPresets()
        for preset in allPresets {
            print(preset)
        }
    }

    static var allTests = [
        ("testExample", testCreatePresets),
    ]
}
