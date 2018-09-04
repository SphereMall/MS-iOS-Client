//
//  ProductPriceConfigurationsResourceTest.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 8/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class ProductPriceConfigurationsResourceTest: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: GRID_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPrice() {
        
        let exp = self.expectation(description: "testAllWithFilter")
        
        client.products.detail(id: "1853") { (product, error) in
            
            XCTAssertNotNil(product)
            XCTAssertNil(error?.status)
            
            guard var affected = product?.data?.first?.attributes?.affectAttributes else {
                XCTFail()
                return
            }
            
            affected[0].attributes!.affectActtributes = [affected[0].attributes!.affectActtributes![0]]
            affected[1].attributes!.affectActtributes = [affected[1].attributes!.affectActtributes![0]]
            affected[2].attributes!.affectActtributes = [affected[2].attributes!.affectActtributes![0]]
            
            let product = PriceProduct(productId: 405, priceTypeId: 1, attributes: affected, options: [])
            
            self.client.priceConfigurator.findProductPrice(priceProduct: product) { (data, error) in
                print(data)
                exp.fulfill() 
            }
        }
        
        wait(for: [exp], timeout: 10)
    }
    
}
