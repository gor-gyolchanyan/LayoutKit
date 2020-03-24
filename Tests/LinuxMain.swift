import XCTest

import LayoutKit_Test

var testCaseEntrySet: [XCTestCaseEntry] {
    var result = [XCTestCaseEntry]()
    result.append(contentsOf: LayoutKit_Test.testCaseEntrySet)
    return result
}

XCTMain(testCaseEntrySet)
