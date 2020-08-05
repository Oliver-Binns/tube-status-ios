//
//  Status.swift
//  Shared
//
//  Created by Oliver Binns on 24/06/2020.
//

import Foundation

public struct StatusUpdate: Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case type = "statusSeverityDescription"
        case reason
    }

    public let id: Int
    public let type: Status
    let reason: String?
}
