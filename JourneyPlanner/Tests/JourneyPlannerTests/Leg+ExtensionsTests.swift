//
//  Leg+ExtensionsTests.swift
//  
//
//  Created by Oliver Binns on 04/06/2022.
//
@testable import JourneyPlanner
@testable import TFLAPI
import XCTest

final class LegExtensionsTests: XCTestCase {
    func testColour() {
        XCTAssertEqual(Leg(mode: .crossrail).color, .crossrail)
        XCTAssertEqual(Leg(mode: .bus).color, .red)
        XCTAssertEqual(Leg(mode: .overground).color, .orange)
        Line.allCases.forEach {
            XCTAssertEqual(Leg(mode: .tube, lineName: $0.rawValue).color, $0.color)
        }
        XCTAssertNil(Leg(mode: .walking).color)
        XCTAssertNil(Leg(mode: .nationalRail).color)
    }
}

extension Leg {
    init(mode: Mode, lineName: String? = nil) {
        self.init(duration: 5, origin: "", destination: "", mode: mode, lineName: lineName)
    }
}
