import XCTest
@testable import TFLAPI

final class ArrayTests: XCTestCase {
    struct Item: Identifiable, Equatable {
        let id = UUID()
    }

    func testRemovingDuplicates() throws {
        let item1 = Item()
        let item2 = Item()
        let item3 = Item()

        XCTAssertEqual([item1, item2, item3, item2, item3].removingDuplicates(),
                       [item1, item2, item3])
    }
}
