//
//  Status.swift
//  Shared
//
//  Created by Oliver Binns on 24/06/2020.
//

import Foundation

struct StatusUpdate: Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case type = "statusSeverityDescription"
        case reason
    }

    let id: Int
    let type: Status
    let reason: String
}
