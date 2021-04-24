import XCTest
@testable import sugar_utils

final class sugar_utilsTests: XCTestCase {
    
    func testCreatePresets() {
        let allPresets = SUOverridePreset.createDefaultPresets()
        let firstPreset = allPresets[0]
        assert(firstPreset.insulinNeedsPercent == 10 && firstPreset.targetRange == (100, 120), "Unexpected preset")
        let lastPreset = allPresets.last!
        assert(lastPreset.insulinNeedsPercent == 200 && lastPreset.targetRange == (200, 220), "Unexpected preset")
    }
    
    func testDefaultPresetNames() {
        var preset = SUOverridePreset.createDefaultPreset(baseTarget: 120, insulinNeedsPercent: 100)
        assert(preset.name == "I: 100% T: 120")
        
        preset = SUOverridePreset.createDefaultPreset(baseTarget: 120, insulinNeedsScaleFactor: 1.0)
        assert(preset.name == "I: 100% T: 120")
    }
    
    func testDefaultTargets() {
        let preset = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        assert(preset.targetRange.minValue == 100)
        assert(preset.targetRange.maxValue == 120)
    }
    
    func testInsulinPercent() {
        let preset = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        assert(preset.insulinNeedsPercent == 90)
        assert(preset.insulinNeedsScaleFactor() == 0.9)
    }
    
    func testEquality() {
        let preset1 = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        let preset2 = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        assert(preset1 == preset2, "Equlity error")
        
        let preset3 = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        let preset4 = SUOverridePreset.createDefaultPreset(baseTarget: 110, insulinNeedsPercent: 90)
        assert(preset3 != preset4, "Equlity error")
        
        let preset5 = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 90)
        let preset6 = SUOverridePreset.createDefaultPreset(baseTarget: 100, insulinNeedsPercent: 100)
        assert(preset5 != preset6, "Equlity error")
    }
}
