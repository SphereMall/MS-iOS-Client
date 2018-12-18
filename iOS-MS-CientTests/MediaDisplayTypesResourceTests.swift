//
//  MediaDisplayTypesResourceTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 12/18/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class MediaDisplayTypesResourceTests: XCTestCase {

    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: DOCUMENTS_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }

    func testAll() {
        let exp = self.expectation(description: "testAllWithFilter")
        client.mediaDisplayPypes.all { (items, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(items)
            exp.fulfill()
        }
    
        wait(for: [exp], timeout: 10)
    }

}
