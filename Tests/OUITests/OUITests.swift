import XCTest
@testable import OUI
import SwiftUI
import SUIObject

final class OUITests: XCTestCase {
    func testExample() {
        let boldText = Text("Some")
                .bold()
        let normalText = Text("Some")
        
        XCTAssertNotEqual(boldText, normalText)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
