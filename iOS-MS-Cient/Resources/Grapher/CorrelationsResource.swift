//
//  CorrelationsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CorrelationsResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    
    override func getURI() -> String {
        return "correlations"
    }
    
    public func getById(id: Int, forClassName: String, closure: @escaping (ProductsSM?, NSError?) -> Swift.Void) {
        
        let params = getQueryParams()
    
        let type = ClassReflectionHelper(className: forClassName).getShortLowerCaseName()
        let uriAppend = client!.getGatewayUrl() + getURI() + "/\(type)/\(id)"
        
        heandler.request(url: uriAppend, method: .get, parameters: params) { (items: ProductsSM?, error: NSError?) in
            closure(items, error)
        }
    }
    
    open override func get(id: String, closure: @escaping SMResponse<ProductsSM>) {
        fatalError("Method get() can not be use with correlations")
    }
    
    open override func create(data: [String: String], closure: @escaping SMResponse<ProductsSM>) {
        fatalError("Method create() can not be use with correlations")
    }
    
    open override func update(id: String, data: [String: String], closure: @escaping SMResponse<ProductsSM>) {
        fatalError("Method update() can not be use with correlations")
    }
    
    open override func delete(id: String, closure: @escaping SMResponseDelete) {
        fatalError("Method delete() can not be use with correlations")
    }
}
