//
//  CriticalTechWorksTests.swift
//  CriticalTechWorksTests
//
//  Created by Bruno Silva on 16/11/2018.
//

import XCTest
@testable import CriticalTechWorks

class CriticalTechWorksTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testServiceGet() {
        XCTAssertNotNil(NetworkManager().getData(endpoint: .characters, page: 0, onSuccess: { (response) in
        }, onError: { (error) in
        }, onFinally: {
        }))
    }
    
    func testServiceGetURI() {
        let urlsString = "http://gateway.CriticalTechWorks.com/v1/public/characters/1017100/comics"
        
        XCTAssertNotNil(NetworkManager().getResourceUri(urlString: urlsString, onSuccess: { (response) in }, onError: { (error) in}) {})
    }

}
