import XCTest
@testable import sugar_utils

final class SugarOverrideTests: XCTestCase {
    
    func testCreatePresets() {
        let allPresets = SULoopOverridePreset.createDefaultPresets()
        let firstPreset = allPresets[0]
        XCTAssert(firstPreset.insulinNeedsPercent == 10 && firstPreset.targetRange == (100, 120), "Unexpected preset")
        let lastPreset = allPresets.last!
        XCTAssert(lastPreset.insulinNeedsPercent == 200 && lastPreset.targetRange == (200, 220), "Unexpected preset")
    }
    
    func testDefaultPresetNames() {
        var preset = SULoopOverridePreset.createDefaultPreset(baseTarget: 120, insulinNeedsPercent: 100)
        XCTAssert(preset.name == "I: 100% T: 120")
        
        preset = SULoopOverridePreset.createDefaultPreset(baseTarget: 120, insulinNeedsScaleFactor: 1.0)
        XCTAssert(preset.name == "I: 100% T: 120")
    }
    
    func testDefaultTargets() {
        let preset = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        XCTAssert(preset.targetRange.minValue == 100)
        XCTAssert(preset.targetRange.maxValue == 120)
    }
    
    func testInsulinPercent() {
        let preset = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        XCTAssert(preset.insulinNeedsPercent == 90)
        XCTAssert(preset.insulinNeedsScaleFactor() == 0.9)
    }
    
    func testEquality() {
        let preset1 = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        let preset2 = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        XCTAssert(preset1 == preset2, "Equlity error")
        
        let preset3 = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        let preset4 = SULoopOverridePreset.createDefaultPreset(baseTarget: 110, insulinNeedsPercent: 90)
        XCTAssert(preset3 != preset4, "Equlity error")
        
        let preset5 = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        let preset6 = SULoopOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 100)
        XCTAssert(preset5 != preset6, "Equlity error")
    }
}
