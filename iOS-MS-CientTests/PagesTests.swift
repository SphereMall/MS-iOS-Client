//
//  PagesTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 5/10/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import XCTest

class PagesTests: XCTestCase {

    var client: SMClient!
    
    override func setUp() {
        client = SMClient(gatewayUrl: GETAWAY,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
        client.setHeaders(headers: ["channel-id" : "1"])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPages() {
        
        let exp = self.expectation(description: "testAllWithFilter")
        client.pages.default { (page, error) in
            
            let containers = page?.data?.first?.attributes?.containers
            var layoutContainerItems: [[LayoutContainerItemsData]] = []
            
            containers?.forEach({ (container) in
                if let container = container.attributes?.layoutContainerItems {
                    layoutContainerItems.append(container)
                }
            })
            
            var slider: [SliderObjectData] = []
            
            layoutContainerItems.forEach({ (containerItem) in
                containerItem.forEach({ (containerItemContent) in
                    if let sld = containerItemContent.attributes?.sliderObjects {
                        slider = sld
                    }
                })
            })
            
            var banner: [BannerObjectData] = []
            
            layoutContainerItems.forEach({ (containerItem) in
                containerItem.forEach({ (containerItemContent) in
                    if let bnd = containerItemContent.attributes?.bannerObjects {
                        banner = bnd
                    }
                })
            })
            
            if banner.count == 0 && slider.count == 0 {
                XCTFail()
            }
            
            XCTAssertNil(error)
            XCTAssertNotNil(page)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
