import XCTest
@testable import sugar_utils

final class SULoopBoolSettingTests: XCTestCase {
    
    func testEquality() {
        XCTAssertEqual(SULoopBoolSetting(settingKey: "key-1", settingValue: true), SULoopBoolSetting(settingKey: "key-1", settingValue: true), "Equlity error")
        XCTAssertNotEqual(SULoopBoolSetting(settingKey: "key-1", settingValue: true), SULoopBoolSetting(settingKey: "key-2", settingValue: true), "Equlity error")
        XCTAssertNotEqual(SULoopBoolSetting(settingKey: "key-1", settingValue: true), SULoopBoolSetting(settingKey: "key-1", settingValue: false), "Equlity error")
        XCTAssertNotEqual(SULoopBoolSetting(settingKey: "key-1", settingValue: true), SULoopBoolSetting(settingKey: "key-2", settingValue: false), "Equlity error")
    }
    
    func testInitialize() {
        let setting1 = SULoopBoolSetting(remoteKey: "Setting:dosingEnabled:true")
        XCTAssertEqual(setting1?.settingKey, "dosingEnabled")
        XCTAssertEqual(setting1?.settingValue, true)
        
        let setting2 = SULoopBoolSetting(remoteKey: "Setting:dosingEnabled:false")
        XCTAssertEqual(setting2?.settingKey, "dosingEnabled")
        XCTAssertEqual(setting2?.settingValue, false)
    }
    
    func testRemoteKeyCreation() {
        let setting1 = SULoopBoolSetting(settingKey: "dosingEnabled", settingValue: true)
        XCTAssert(setting1.remoteKey() == "Setting:dosingEnabled:true")
        
        let setting2 = SULoopBoolSetting(settingKey: "dosingEnabled", settingValue: false)
        XCTAssert(setting2.remoteKey() == "Setting:dosingEnabled:false")
    }
}
