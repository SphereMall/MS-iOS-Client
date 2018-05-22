//
//  CatalogItemsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CatalogItemsResource<T: Decodable> : Resource <CatalogItemsSM> {
    
    public typealias T = CatalogItemsSM
    
    override public func getURI() -> String {
        return "catalogitems"
    }
    
    public override func get(id: String, closure: @escaping (CatalogItemsSM?, ErrorSM?) -> Void) {
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
