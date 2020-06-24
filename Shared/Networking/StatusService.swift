//
//  StatusService.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//

import Foundation

public struct StatusService {
    public static func getStatus(client: NetworkClient,
                                 for line: Line,
                                 completion: (([LineStatusUpdate]) -> Void)? = nil) {
        runStatusRequest(.statusForLine(line), on: client, completion: completion)
    }

    public static func getStatus(client: NetworkClient, completion: (([LineStatusUpdate]) -> Void)? = nil) {
        runStatusRequest(.lineStatus, on: client, completion: completion)
    }

    private static func runStatusRequest(_ request: URLRequest,
                                         on client: NetworkClient,
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
