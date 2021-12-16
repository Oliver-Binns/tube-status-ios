//
//  Leg.swift
//  
//
//  Created by Oliver Binns on 16/12/2021.
//
import Foundation

public struct Leg: Decodable {
    public let id = UUID()
    public let duration: Int

    public let origin: String
    public let destination: String

    public let mode: Mode
    public let line: Line?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        duration = try values.decode(Int.self, forKey: .duration)

        origin = try values
            .nestedContainer(keyedBy: CodingKeys.self, forKey: .departurePoint)
            .decode(String.self, forKey: .commonName)
            .replacingOccurrences(of: " Underground Station", with: "")
        destination = try values
            .nestedContainer(keyedBy: CodingKeys.self, forKey: .arrivalPoint)
            .decode(String.self, forKey: .commonName)
            .replacingOccurrences(of: " Underground Station", with: "")

        mode = try values
            .nestedContainer(keyedBy: CodingKeys.self, forKey: .mode)
            .decode(Mode.self, forKey: .name)

        var routeOptions = try values.nestedUnkeyedContainer(forKey: .routeOptions)
        line = try routeOptions
            .nestedContainer(keyedBy: CodingKeys.self)
            .nestedContainer(keyedBy: CodingKeys.self, forKey: .lineIdentifier)
            .decode(Line.self, forKey: .name)
    }

    enum CodingKeys: String, CodingKey {
        case duration
        case departurePoint, arrivalPoint
        case mode
        case routeOptions

        case commonName
        case name
        case lineIdentifier
    }
}

extension Leg: Identifiable { }
