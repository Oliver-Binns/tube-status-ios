//
//  NetworkClient.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//
import Combine
import Foundation

public final class NetworkClient {
    private let session: URLSession

    enum NetworkError: Error {
        case noData
    }

    public init(session: URLSession = .shared) {
        self.session = session
    }

    func executeRequest(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }

    func executeRequest(request: URLRequest) -> AnyPublisher<Data, URLError> {
        session.dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
