//
//  EventsResourceTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 5/27/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import XCTest

class EventsResourceTests: XCTestCase {

    var client: SMClient!
    
    override func setUp() {
        client = SMClient(gatewayUrl: "http://gateway-df-1cbase.alpha.spheremall.net/v1/",
                          clientId: "api_demo_user",
                          secretKey: "platform_web_client").setHeaders(["channel-id" : "1"])
    }

    func testEvents() {
        let exp = self.expectation(description: "testEvents")
        client.events.all { (events, error) in
            XCTAssertNotNil(events)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testEventsById() {
        let exp = self.expectation(description: "testEventsById")
        
        client.events.all { (events, error) in
            XCTAssertNotNil(events)
            if let id = events?.data?.first?.id {
                self.client.events.get(id: id) { (event, error) in
                    XCTAssertNotNil(event)
                    exp.fulfill()
                }
            } else {
                XCTFail()
                exp.fulfill()
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testSendEvent() {
        let exp = self.expectation(description: "testEvents")
        client.userEvents.send("EntranceConsumerEvent",
                               userId: "5696",
                               eventData: "54230952349853234") { (event, error) in
            XCTAssertNotNil(event)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testSendEventGet() {
        let exp = self.expectation(description: "testSendEventGet")
        client.userEvents.get(id: "18270") { (event, error) in
            XCTAssertNotNil(event)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
