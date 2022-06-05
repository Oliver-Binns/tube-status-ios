//
//  Journey.swift
//
import Foundation

struct JourneyResponse: Decodable {
    let journeys: [Journey]
}

public struct Journey {
    public let id = UUID()
    public let departureDate: Date
    public let arrivalDate: Date
    public let duration: Int
    public let legs: [Leg]
}

extension Journey: Identifiable { }
extension Journey: Decodable {
    private enum CodingKeys: String, CodingKey {
        case departureDate = "startDateTime"
        case arrivalDate = "arrivalDateTime"
        case duration, legs
    }
}
