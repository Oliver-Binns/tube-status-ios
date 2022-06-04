//
//  ColorTests.swift
//  
//
//  Created by Oliver Binns on 10/11/2021.
//
import SwiftUI
import XCTest
@testable import BaseUI

final class ColorTests: XCTestCase {
    func test_coloursExist() {
        XCTAssertNotNil(Color.crossrail)
        XCTAssertNotNil(Color.background)
    }
}
