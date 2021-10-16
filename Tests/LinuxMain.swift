import XCTest

import sugar_utilsTests

var tests = [XCTestCaseEntry]()
tests += SULoopOverridePreset.allTests()
tests += SULoopBoolSettingTests.allTests()
XCTMain(tests)
