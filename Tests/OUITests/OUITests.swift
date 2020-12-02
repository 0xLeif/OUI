import XCTest
@testable import OUI

final class OUITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(OUI().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
