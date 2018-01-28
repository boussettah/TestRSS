//
//  testRSSTests.swift
//  testRSSTests
//
//  Created by hager boussetta on 25/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import XCTest
@testable import testRSS

class testRSSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testXMLMapping() throws {
        
        let bundle = Bundle(for: type(of: self))
        /*guard let url = bundle.url(forResource: "Feed", withExtension: "xml") else {
            XCTFail("Missing file: Feed.xml")
            return
        }
        let xml = try Data(contentsOf: url)
        */
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
