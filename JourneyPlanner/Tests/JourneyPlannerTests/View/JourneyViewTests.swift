@testable import JourneyPlanner
@testable import TFLAPI
import SwiftUI
import ViewInspector
import XCTest

final class JourneyViewTests: XCTestCase {
    var sut: JourneyView!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let departureDate = try XCTUnwrap(Calendar.current.date(byAdding: .minute, value: 1, to: .init()))
        let arrivalDate = try XCTUnwrap(Calendar.current.date(byAdding: .minute, value: 30, to: .init()))

        let legOne = Leg(duration: 20,
                         origin: "Hackney Central",
                         destination: "Highbury & Islington",
                         mode: .overground,
                         lineName: nil)

        let legTwo = Leg(duration: 10,
                         origin: "Highbury & Islington",
                         destination: "Oxford Circus",
                         mode: .tube,
                         lineName: "Victoria")

        let journey = Journey(departureDate: departureDate,
                              arrivalDate: arrivalDate,
                              duration: 30,
                              legs: [legOne, legTwo])

        sut = .init(journey: journey)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDisplaysJourneyOverview() throws {
        let overview = try sut.body.inspect().vStack()

        let times = try overview.vStack(0)
        XCTAssertEqual(try times.alignment(), .leading)

        // Departure Time
        let departureTime = try times.hStack(0)
        XCTAssertEqual(try departureTime.text(0).string(), "Departs")
        XCTAssertEqual(try departureTime.text(1).string(), "in 59 seconds")

        // Arrival Time
        let arrivalTime = try times.hStack(1)
        XCTAssertEqual(try arrivalTime.text(0).string(), "Arrives")
        XCTAssertEqual(try arrivalTime.text(1).string(), "in 29 minutes")

        // Duration
        XCTAssertEqual(try overview.text(1).string(), "Total Duration: 30 min")
    }

    func testDisplaysJourneyLegs() throws {
        let legs = try sut.body.inspect().vStack().vStack(2)
        try XCTAssertEqual(legs.alignment(), .leading)

        // Origin:
        XCTAssertEqual(try legs.text(0).string(), "Hackney Central")

        // Leg One:
        let legOne = try legs.forEach(1).tupleView(0)
        XCTAssertTrue(try legOne.hStack(0).hStack(0)[2].isAbsent)
        XCTAssertEqual(try legOne.hStack(0).text(1).string(), "20 min")
        XCTAssertEqual(try legOne.text(1).string(), "Highbury & Islington")

        // Leg Two:
        let legTwo = try legs.forEach(1).tupleView(1)
        XCTAssertEqual(try legTwo.hStack(0).hStack(0).text(2).string(), "Victoria")
        XCTAssertEqual(try legTwo.hStack(0).text(1).string(), "10 min")
        XCTAssertEqual(try legTwo.text(1).string(), "Oxford Circus")
    }
}

extension JourneyView: Inspectable { }
