//
//  StatusService.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//
import Foundation

public struct StatusService {
    private let client: NetworkClient

    public init(client: NetworkClient = .init()) {
        self.client = client
    }

    public func getStatus(for line: Line,
                          completion: (([LineStatusUpdate]) -> Void)? = nil) {
        runStatusRequest(.statusForLine(line), completion: completion)
    }

    public func getStatus(completion: (([LineStatusUpdate]) -> Void)? = nil) {
        runStatusRequest(.lineStatus, completion: completion)
    }

    private func runStatusRequest(_ request: URLRequest,
                                  completion: (([LineStatusUpdate]) -> Void)? = nil) {
        client.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let lineStatus = try decoder.decode([LineStatusUpdate].self, from: data)
                    completion?(lineStatus)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
