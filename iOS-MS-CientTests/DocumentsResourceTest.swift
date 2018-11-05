//
//  DocumentsResourceTest.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class DocumentsResourceTest: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: DOCUMENTS_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testResourceDocuments() {
        let exp = self.expectation(description: "testGet")
        client.documents.all { (items, error) in
            XCTAssertNotNil(items)
            XCTAssertNil(error)
            XCTAssertNotNil(items?.data?.first?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testResourceDocumentsFull() {
        let exp = self.expectation(description: "testGet")
        client.documents.fullAll { (documents, error) in
            XCTAssertNotNil(documents)
            XCTAssertNil(error)
            XCTAssertNotNil(documents?.data?.first?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testDetail() {
    
        let exp = self.expectation(description: "testGet")

        client.documents.detail(id: "98") { (documents, error) in
            XCTAssertNotNil(documents)
            XCTAssertNil(error)
            XCTAssertNotNil(documents?.data?.first?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
