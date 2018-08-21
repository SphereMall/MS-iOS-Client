//
//  Promotions.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 8/21/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class Promotions: XCTestCase {
    
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
        
        client.products.detail(id: "1853") { (data, error) in
            
            XCTAssertNotNil(data)
            XCTAssertNil(error?.status)
            
            guard var affected = data?.data?.first?.attributes?.affectAttributes else {
                XCTFail()
                return
            }
            
            affected[0].attributes!.affectActtributes = [affected[0].attributes!.affectActtributes![0]]
            affected[1].attributes!.affectActtributes = [affected[1].attributes!.affectActtributes![0]]
            affected[2].attributes!.affectActtributes = [affected[2].attributes!.affectActtributes![0]]
            
            let product = PriceProduct(productId: 1853, priceTypeId: 1, attributes: affected, options: [])
            
            XCTAssertNotNil(data)
            
            self.client.promotions.price(priceProduct: product) { (data, error) in
                
                let vat = 20
                var result = 0.0
                var resultOld = 0.0
                
                guard let price = data?.data?.first?.attributes else { return }
                
                if price.discountTypeId == "2" {
                    let k = Double((Int(price.price!)! * (1 + (vat / 100))))
                    result = (round(k) - Double(price.discountPrice!)!) / 100
                } else {
                    result = round(Double(price.itemPrice!)! * Double((1 + (vat / 100)))) / 100.0
                }
                
                resultOld = round(Double(price.price!)! * Double((1 + (vat / 100)))) / 100.0
                
                print(result)
                print(resultOld)
                
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 10)
    }
    
}
