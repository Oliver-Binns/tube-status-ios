//
//  JourneyService.swift
//  
//
//  Created by Oliver Binns on 03/12/2021.
//
import Combine
import Foundation

public struct JourneyService {
    private let client: NetworkClient

    public init(client: NetworkClient = .init()) {
        self.client = client
    }

    public func planJourney(from origin: Station, to destination: Station) -> AnyPublisher<[Station], Error> {
        client
            .executeRequest(request: .planJourney(from: origin.id, to: destination.id))
            .decode(type: [Station].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
