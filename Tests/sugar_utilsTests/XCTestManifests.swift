import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SULoopOverridePreset.allTests + SULoopBoolSettingTests.allTests),
    ]
}
#endif
