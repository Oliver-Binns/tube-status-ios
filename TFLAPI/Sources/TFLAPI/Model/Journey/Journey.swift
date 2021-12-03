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

struct Journey: Decodable {
    let departureDate: Date
    let arrivalDate: Date

    private enum CodingKeys: String, CodingKey {
        case departureDate = "startDateTime"
        case arrivalDate = "arrivalDateTime"
    }
}
