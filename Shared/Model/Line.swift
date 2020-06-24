//
//  Line.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
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
extension Line {
    var id: String {
        switch self {
        case .hammersmith:
            return "hammersmith-city"
        case .waterloo:
            return "waterloo-city"
        default:
            return rawValue.lowercased()
        }
    }

    var displayName: String {
        switch self {
        case .hammersmith:
            return "H'smith & City"
        default: return rawValue
        }
    }
}
