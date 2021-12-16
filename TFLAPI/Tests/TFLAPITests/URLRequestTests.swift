//
//  URLRequestTests.swift
//  
//
//  Created by Oliver Binns on 03/12/2021.
//
import XCTest
@testable import TFLAPI

final class URLRequestTests: XCTestCase {
    func test_lineStatus() {
        XCTAssertEqual(URLRequest.lineStatus.url?.path, "/line/mode/tube/status")
    }
}
