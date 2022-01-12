//
//  JourneyServiceTests.swift
//  
//
//  Created by Oliver Binns on 03/12/2021.
//
import Combine
import XCTest
@testable import TFLAPI

final class JourneyServiceTests: XCTestCase {
    var sut: JourneyService!
    private var cancellables: [AnyCancellable] = []

    override func setUp() {
        super.setUp()

        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)

        sut = .init(client: .init(session: session))
    }
}
extension JourneyServiceTests {
    func test_planJourney() {
        MockURLProtocol.requestHandler = { _ in
            try (.success, .fromFile(named: "Journey"))
        }

        let exp = expectation(description: "Wait for response to network call")

        sut.planJourney(from: "Holborn", to: "SouthWoodford")
            .sink { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but received error: \(error)")
                }
                exp.fulfill()
            } receiveValue: { journeys in
                XCTAssertEqual(journeys.count, 3)
                XCTAssertEqual(journeys[0].duration, 57)
                XCTAssertEqual(journeys[1].duration, 59)
                XCTAssertEqual(journeys[2].duration, 58)
            }
            .store(in: &cancellables)

        wait(for: [exp], timeout: 4)
    }
}
