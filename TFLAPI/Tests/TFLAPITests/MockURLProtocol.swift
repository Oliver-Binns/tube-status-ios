//
//  MockURLProtocol.swift
//  
//
//  Created by Oliver Binns on 03/12/2021.
//
import Foundation

final class MockURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        // This is where you create the mock response as per your test case
        // and send it to the URLProtocolClient.
    }

    override func stopLoading() {
        // This is called if the request gets canceled or completed.
    }
}
