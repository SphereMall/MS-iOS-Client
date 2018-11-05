//
//  ExternalUserRelationResource.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 11/3/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class ExternalUserRelationResourceTests: XCTestCase {

    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: DOCUMENTS_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }

    func testPerformanceExample() {
    
    }
    
    func testCreate() {
        
        let params: [String: String] = ["userId": "153", "relatedUserId": "777", "relationType": "magneds"]
        
        let exp = self.expectation(description: "testAllWithFilter")
        client.externalUser.create(data: params) { (user, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(user)
            guard let id = user?.data?.first?.id else {
                XCTFail()
                exp.fulfill()
                return
            }
            
            self.client.externalUser.delete(id: id) { (issuccess, error) in
                XCTAssertNil(error)
                XCTAssertTrue(issuccess ?? false)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 10)
    }
}
