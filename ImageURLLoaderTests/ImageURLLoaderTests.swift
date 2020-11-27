//
//  ImageURLLoaderTests.swift
//  ImageURLLoaderTests
//
//  Created by Xuwei Liang on 27/11/20.
//

import XCTest
@testable import ImageURLLoader

class ImageURLLoaderTests: XCTestCase {

    func testValidImageUrlHttps() {
        let timeout = 10.0
        ImageURLLoader(timeout: timeout).loadImage(from: "https://simgbb.com/images/logo.png") { image in
            XCTAssertNotNil(image)
        }
    }
    
    func testValidImageUrlHttp() {
        let timeout = 10.0
        ImageURLLoader(timeout: timeout).loadImage(from: "http://simgbb.com/images/logo.png") { image in
            XCTAssertNotNil(image)
        }
    }
    
    func testInvalidImageUrl() {
        let timeout = 10.0
        ImageURLLoader(timeout: timeout).loadImage(from: "http://aaaa.ico") { image in
            XCTAssertNil(image)
        }
    }
}
