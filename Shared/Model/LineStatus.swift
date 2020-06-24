//
//  Line.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//

import Foundation

public enum Line: String, Decodable, CaseIterable {
    case bakerloo = "Bakerloo"
    case central = "Central"
    case circle = "Circle"
    case district = "District"
    case hammersmith = "Hammersmith & City"
    case jubilee = "Jubilee"
    case metropolitan = "Metropolitan"
    case northern = "Northern"
    case piccadilly = "Piccadilly"
    case victoria = "Victoria"
    case waterloo = "Waterloo & City"
}
public struct LineStatusUpdate: Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case line = "name"
        case statuses = "lineStatuses"
    }

    public let id: String
    public let line: Line
    public let statuses: [Status]
}
