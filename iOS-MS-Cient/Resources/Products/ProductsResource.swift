//
//  Products.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/29/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class ProductsResource<T: Decodable> : Resource <ProductsSM>, FullResource {
    
    public typealias T = ProductsSM

    override public func getURI() -> String {
        return "products"
    }
    
    public func detail(id: String, closure: @escaping (ProductsSM?, ErrorSM?) -> Void) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/detail/\(id)"
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (item: ProductsSM?, error) in
            closure(item?.rebuild(), error)
        }
    }
    
    public override func get(id: String, closure: @escaping (ProductsSM?, ErrorSM?) -> Void) {
        
        super.get(id: id) { (product, error) in
            closure(product?.rebuild(), error)
        }
    }
    
    public override func all(closure: @escaping SMResponse<T>) {
        super.all { (items, error) in
            closure(items?.rebuild(), error)
        }
    }
    
    public override func first(closure: @escaping SMResponse<T>) {
        super.first { (item, error) in
            closure(item?.rebuild(), error)
        }
    }
    
    public override func create(data: [String: String], closure: @escaping SMResponse<T>) {
        super.create(data: data) { (item, error) in
            closure(item?.rebuild(), error)
        }
    }
    
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<T>) {
        super.update(id: id, data: data) { (items, error) in
            closure(items?.rebuild(), error)
        }
    }
}

public extension String {
    public var isInt: Bool {
        return Int(self) != nil
    }
}
