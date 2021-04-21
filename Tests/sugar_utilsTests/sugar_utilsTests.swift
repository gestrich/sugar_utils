import XCTest
@testable import sugar_utils

final class sugar_utilsTests: XCTestCase {
    
    func testCreatePresets() {
        let allPresets = SUOverridePreset.createDefaultPresets()
        for preset in allPresets {
            print(preset)
        }
    }
    
    func testDefaultPresetNames() {
        var preset = SUOverridePreset.createPresetWithDefaultNamingScheme(targetBase: 120, insulinNeedsPercent: 100)
        assert(preset.name == "I: 100% T: 120")
        
        preset = SUOverridePreset.createPresetWithDefaultNamingScheme(targetBase: 120, insulinNeedsScaleFactor: 1.0)
        assert(preset.name == "I: 100% T: 120")
    }
    
    func testDefaultTargets() {
        let preset = SUOverridePreset.createPresetWithDefaultNamingScheme(targetBase: 100, insulinNeedsPercent: 90)
        assert(preset.targetRange.0 == 100)
        assert(preset.targetRange.1 == 120)
    }
}
