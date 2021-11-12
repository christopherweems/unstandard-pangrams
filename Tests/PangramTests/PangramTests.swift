import XCTest
@testable import Pangrams

final class PangramTests: XCTestCase {
    func testEnglishPangram() {
        let randomEnglishPangram = Pangrams.random(in: .english)
        XCTAssertFalse(randomEnglishPangram.isEmpty)
    }
    
}
