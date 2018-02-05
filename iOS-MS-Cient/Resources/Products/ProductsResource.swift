//
//  Products.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/29/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

class ProductsResource<ProductsSM: Decodable> : Resource <ProductsSM>, FullResource {
    
    typealias T = ProductsSM
    
    override func getURI() -> String {
        return "products"
    }
    
//    public func full(param: String?, closure: @escaping (ProductsSM?, NSError?) -> Swift.Void ) {
//        var uriAppend = "full"
//        let params = self.getQueryParams()
//        
//        if param != nil {
//            if param!.isInt {
//                uriAppend = uriAppend + "/\(param!)"
//            } else {
//                uriAppend = "url/\(param!)"
//            }
//        }
//        
//        self.heandler.request(url: uriAppend, method: .get, parameters: params) { (items, error) in
//            closure(items, error)
//        }
//    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}