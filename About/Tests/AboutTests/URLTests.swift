//
// URLTests.swift
//  
//
//  Created by Oliver Binns on 10/11/2021.
//
import XCTest
@testable import About

final class URLTests: XCTestCase {
    func testDefaultURLs() {
        XCTAssertEqual(URL.twitter.absoluteString,
                       "https://www.twitter.com/oliver_binns")
    }
}
