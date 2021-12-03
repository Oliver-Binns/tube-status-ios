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
        let session = URLSession.init(configuration: configuration)

        sut = .init(client: .init(session: session))
    }

    func test_planJourney() {
        sut.planJourney(from: Station(id: "123", name: "Holborn", lines: [.central]),
                        to: Station(id: "456", name: "South Woodford", lines: [.central]))
            .sink { error in

            } receiveValue: { stations in

            }
            .store(in: &cancellables)

    }
}
