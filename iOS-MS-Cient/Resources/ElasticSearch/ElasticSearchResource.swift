//
//  ElasticSearchResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 10/2/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class ElasticSearchResource <T: Decodable> : Resource <ProductsSM> {
    
    override public func getURI() -> String {
        return "elasticsearch"
    }
    
    override func all(closure: @escaping (ProductsSM?, ErrorSM?) -> Void) {
        
    }
    
    override func getQueryParams() -> [String : String] {
        return [:]
    }
    
    @available(*, unavailable, message: "Method count() can not be used")
    public override func count(closure: @escaping SMResponseCount) {}
    
    @available(*, unavailable, message: "Method get() can not be used")
    public override func get(id: String, closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method create() can not be used")
    public override func create(data: [String: String], closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method update() can not be used")
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method delete() can not be used")
    public override func delete(id: String, closure: @escaping SMResponseDelete) {}

}
