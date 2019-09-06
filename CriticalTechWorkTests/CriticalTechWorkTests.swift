//
//  CriticalTechWorkTests.swift
//  CriticalTechWorkTests
//
//  Created by Bruno Silva on 05/09/2019.
//

import XCTest
import CoreLocation
@testable import CriticalTechWorks

class CriticalTechWorkTests: XCTestCase {
    
    var sut: LocationManager!
    
    override func setUp() {
        self.sut = LocationManager()
    }

    override func tearDown() {
        self.sut = LocationManager()
    }
    
    func test_getCurrentLocation_returnsExpectedLocation() {
        let expectedLocation = CLLocation(latitude: 10.0, longitude: 10.0)
        let completionExpectation = expectation(description: "completion expectation")
        
        sut.getCurrentLocation { (location) in
            completionExpectation.fulfill()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
