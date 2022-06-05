@testable import JourneyPlanner
import SwiftUI
@testable import TFLAPI
import ViewInspector
import XCTest

final class StationPickerTests: XCTestCase {
    var sut: StationPicker!
    // swiftlint:disable:next redundant_optional_initialization
    @Binding var id: String? = nil

    override func setUp() {
        super.setUp()
        sut = .init(title: "Origin",
                    stations: .mock,
                    id: $id)
    }

    override func tearDown() {
        sut = nil
        id = nil
        super.tearDown()
    }

    func testTitleText() throws {
        let title = try sut.body.inspect().vStack().text(0)
        try XCTAssertEqual(title.string(), "Origin")
        try XCTAssertEqual(title.attributes().font(), .caption2)
        try XCTAssertEqual(title.attributes().fontWeight(), .semibold)
    }

    func testPickerContainsContent() throws {
        let picker = try sut.body.inspect().vStack().picker(1)
        let content = picker.findAll(ViewType.Text.self)

        try XCTAssertEqual(content.first?.string(), "Select Station")

        for station in sut.stations {
            let text = try content
                .first(where: { try $0.tag() as? String == station.id })
            try XCTAssertEqual(text?.string(), station.name)
        }

        XCTAssertEqual(content.count, 12)
    }

    func testPickerUpdatesBinding() throws {
        // GIVEN no station is selected
        XCTAssertNil(sut.id)

        // WHEN I select a station using the picker
        let picker = try sut.body.inspect().vStack().picker(1)
        try picker.select(value: sut.stations.first?.id)

        // THEN the binding is updated
        XCTAssertEqual(sut.id, sut.stations[0].id)
    }
}
extension Station {
    static func mock(named name: String = UUID().uuidString) -> Self {
        Station(id: UUID().uuidString, name: name, lines: [])
    }
}
extension Array where Element == Station {
    static var mock: Self {
        (0..<10).map { _ in
            .mock()
        }
    }
}
