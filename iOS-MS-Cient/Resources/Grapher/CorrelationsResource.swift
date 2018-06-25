//
//  CorrelationsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CorrelationsResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    override public func getURI() -> String {
        return "correlations"
    }
    
    public func getById(id: String, forClassName: String, closure: @escaping (ProductsSM?, ErrorSM?) -> Swift.Void) {
        
        let params = getQueryParams()
        
        let type = ClassReflectionHelper(className: forClassName).getShortLowerCaseName()
        let uriAppend = client!.getGatewayUrl() + getURI() + "/\(type)/\(id)"
        
        heandler.request(url: uriAppend, method: .get, parameters: params) { (items: ProductsSM?, error: ErrorSM?) in
            closure(items, error)
        }
    }
    
    public func getById(id: Int, forClassName: String, closure: @escaping (ProductsSM?, ErrorSM?) -> Swift.Void) {
        
        let params = getQueryParams()
    
        let type = ClassReflectionHelper(className: forClassName).getShortLowerCaseName()
        let uriAppend = client!.getGatewayUrl() + getURI() + "/\(type)/\(id)"
        
        heandler.request(url: uriAppend, method: .get, parameters: params) { (items: ProductsSM?, error: ErrorSM?) in
            closure(items, error)
        }
    }
    
    @available(*, unavailable, message: "Method get() can not be use with correlations")
    public override func get(id: String, closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method create() can not be use with correlations")
    public override func create(data: [String: String], closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method update() can not be use with correlations")
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method delete() can not be use with correlations")
    public override func delete(id: String, closure: @escaping SMResponseDelete) {}
}
