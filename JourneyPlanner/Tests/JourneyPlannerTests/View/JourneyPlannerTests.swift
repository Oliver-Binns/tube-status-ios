@testable import JourneyPlanner
import SwiftUI
import ViewInspector
import XCTest

final class JourneyPlannerTests: XCTestCase {
    var mockStationService: MockStationService!
    var mockJourneyService: MockJourneyService!

    var viewModel: JourneyPlannerViewModel!
    var sut: JourneyPlanner!

    override func setUp() {
        super.setUp()
        mockStationService = .init()
        mockJourneyService = .init()
        viewModel = .init(stationService: mockStationService,
                          journeyService: mockJourneyService)

        sut = .init(viewModel: viewModel)
    }

    override func tearDown() {
        sut = nil
        mockStationService = nil
        mockJourneyService = nil
        viewModel = nil
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

    func testDisplaysPickersForStationsOnLoad() throws {
        // GIVEN the Journey Planner view has appeared
        try sut.body.inspect().vStack().callOnAppear()

        // WHEN the list of stations is received
        mockStationService.subject.send([.mock(named: "Oxford Circus"),
                                         .mock(named: "Acton Central")])

        // THEN the progress view disappears
        let exp = expectation(for: .init(block: { _, _ in
            (try? self.sut.body.inspect().vStack().progressView(0)) == nil
        }), evaluatedWith: nil, handler: nil)
        wait(for: [exp], timeout: 3)

        // AND the picker view appears
        let pickerContainer = try sut.body.inspect().vStack().form(0).section(0)
            .find(StationPicker.self)
        XCTAssertNotNil(pickerContainer)
        try XCTAssertEqual(pickerContainer.vStack().text(0).string(), "Origin")

        let picker = try pickerContainer.vStack().picker(1)
        try XCTAssertEqual(picker.text(0).string(), "Select Station")
        try XCTAssertEqual(picker.forEach(1).text(0).string(), "Oxford Circus")
        try XCTAssertEqual(picker.forEach(1).text(1).string(), "Acton Central")
    }
}

extension StationPicker: Inspectable { }
