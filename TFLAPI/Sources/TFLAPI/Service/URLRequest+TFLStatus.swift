//
//  URLRequestPool.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//

import Foundation

extension URLRequest {
    private static var baseURL: String { "https://api.tfl.gov.uk/" }

    static var lineStatus: URLRequest {
        .init(endpoint: "line", "mode", "tube", "status")
    }

    static func statusForLine(_ line: Line) -> URLRequest {
        .init(endpoint: "line", line.id, "status")
    }

    static func planJourney(from origin: String, to destination: String) -> URLRequest {
        .init(endpoint: "journey", "journeyresults", origin, "to", destination)
    }

    static func getStops(on line: Line) -> URLRequest {
        .init(endpoint: "line", line.id, "stoppoints")
    }

    init(endpoint: String...) {
        guard let url = URL(string: Self.baseURL + endpoint.joined(separator: "/")) else {
            preconditionFailure("Expected a valid URL")
        }
        self.init(url: url)
    }
}
