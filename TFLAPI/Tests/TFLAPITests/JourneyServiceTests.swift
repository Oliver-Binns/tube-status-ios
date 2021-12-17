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
        sut.planJourney(from: "Holborn", to: "SouthWoodford")
            .sink { error in
                print(error)
            } receiveValue: { stations in
                print(stations)
            }
            .store(in: &cancellables)

    }
}
