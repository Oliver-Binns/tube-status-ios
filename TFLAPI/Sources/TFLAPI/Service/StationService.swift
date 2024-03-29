//
//  StationService.swift
//  
//
//  Created by Oliver Binns on 14/10/2021.
//
import Combine
import Foundation

public struct StationService {
    private let client: NetworkClient

    public init(client: NetworkClient = .init()) {
        self.client = client
    }

    public func getStations(on line: Line) -> AnyPublisher<[Station], Error> {
        client
            .executeRequest(request: .getStops(on: line))
            .decode(type: [Station].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    public func getAllStations() -> AnyPublisher<[Station], Error> {
        Publishers
            .MergeMany(Line.allCases.map { getStations(on: $0) })
            .collect()
            // Convert Array of Publishers into Publisher of Array
            .map { $0.flatMap { $0 } }
            // Remove Duplicate Stations, i.e. stations that are on multiple lines
            .map { $0.removingDuplicates() }
            .map { $0.sorted(on: \.name) }
            .eraseToAnyPublisher()
    }
}
