//
//  JourneyPlannerTests.swift
//  
//
//  Created by Oliver Binns on 10/11/2021.
//
@testable import JourneyPlanner
import SwiftUI
import ViewInspector
import XCTest

final class StationPickerTests: XCTestCase {
    var sut: StationPicker!

    override func setUp() {
        super.setUp()
        sut = .init(title: "Origin",
                    stations: [],
                    id: .constant(nil))
    }

    func testTitleText() throws {
        let title = try sut.body.inspect().vStack().text(0)
        try XCTAssertEqual(title.string(), "Origin")
        try XCTAssertEqual(title.attributes().font(), .caption2)
        try XCTAssertEqual(title.attributes().fontWeight(), .semibold)
    }

    func testPicker() throws {
        _ = try sut.body.inspect().vStack().picker(1)
    }
}
