@testable import JourneyPlanner
import SwiftUI
import ViewInspector
import XCTest

final class JourneyPlannerTests: XCTestCase {
    var sut: JourneyPlanner!
    var mockStationService: MockStationService!
    var mockJourneyService: MockJourneyService!

    override func setUp() {
        super.setUp()
        mockStationService = .init()
        mockJourneyService = .init()
        sut = .init(stationService: mockStationService,
                    journeyService: mockJourneyService)
    }

    override func tearDown() {
        sut = nil
        mockStationService = nil
        mockJourneyService = nil
        super.tearDown()
    }

    func testViewDisplaysLoadingIndicatorOnAppear() throws {
        XCTAssertNotNil(try sut.body.inspect().vStack().progressView(0))
    }

    func testRequestsStationsOnAppear() throws {
        XCTAssertFalse(mockStationService.requestedAll)
        try sut.body.inspect().callOnAppear()
        XCTAssertTrue(mockStationService.requestedAll)
    }

    /*
     func testDisplaysPickersForStationsOnLoad() throws {
        // GIVEN the Journey Planner view has appeared
        try sut.body.inspect().vStack().callOnAppear()

        // WHEN the list of stations is received
        mockStationService.subject.send([.mock, .mock])

        // THEN the progress view disappears
        let exp = expectation(for: .init(block: { _,_ in
            (try? self.sut.body.inspect().vStack().progressView(0)) == nil
        }), evaluatedWith: nil, handler: nil)
        wait(for: [exp], timeout: 3)

        // AND the picker view appears
        let picker = try sut.body.inspect().vStack().form(0).section(0)
            .find(StationPicker.self)
    } */
}

extension StationPicker: Inspectable { }
