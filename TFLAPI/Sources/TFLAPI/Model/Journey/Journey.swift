//
//  Journey.swift
//  
//
//  Created by Oliver Binns on 03/12/2021.
//
import Foundation

struct JourneyResponse: Decodable {
    let journeys: [Journey]
}

public struct Journey: Decodable {
    public let id = UUID()
    public let departureDate: Date
    public let arrivalDate: Date
    public let duration: Int
    public let legs: [Leg]

    private enum CodingKeys: String, CodingKey {
        case departureDate = "startDateTime"
        case arrivalDate = "arrivalDateTime"
        case duration, legs
    }
}
extension Journey: Identifiable { }
