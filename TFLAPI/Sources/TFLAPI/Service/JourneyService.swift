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
    private let decoder: JSONDecoder

    public init(client: NetworkClient = .init()) {
        self.client = client
        self.decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
    }

    public func planJourney(from originID: String, to destinationID: String) -> AnyPublisher<[Journey], Error> {
        client
            .executeRequest(request: .planJourney(from: originID, to: destinationID))
            .decode(type: JourneyResponse.self, decoder: decoder)
            .map(\.journeys)
            .eraseToAnyPublisher()
    }
}
