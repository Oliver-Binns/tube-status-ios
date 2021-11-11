//
//  File.swift
//  
//
//  Created by Oliver Binns on 14/10/2021.
//
import Foundation

public struct Station: Decodable, Identifiable {
    public let id: String
    public let name: String
    public let lines: [Line]

    enum CodingKeys: String, CodingKey {
        case id
        case name = "commonName"
        case lines
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
            .replacingOccurrences(of: " Underground Station", with: "")
        lines = try values.decode([LineResult].self, forKey: .lines)
            .map { $0.name }
            .compactMap(Line.init)

    }
}

extension Station: Equatable {
    public static func ==(lhs: Station, rhs: Station) -> Bool {
        lhs.id == rhs.id
    }
}

private struct LineResult: Decodable {
    let name: String
}
