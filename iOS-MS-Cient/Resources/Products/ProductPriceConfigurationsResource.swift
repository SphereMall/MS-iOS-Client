//
//  ProductPriceConfigurationsResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ProductPriceConfigurationsResource<T: Decodable> : Resource <PriceValueSM> {
    
    override public func getURI() -> String {
        return "findprice"
    }
    
    public func findPrice(filter: PriceConfigurationFilter, closure: @escaping (PriceValueSM?, ErrorSM?) -> Swift.Void) {
    
        let data = filter.getData()
        var params: [String: String] = [:]
        
        params["filters"] = data
        
        let url = client!.getGatewayUrl() + getURI()
        
        heandler.request(url: url, method: .post, parameters: params) { (items: PriceValueSM?, error: ErrorSM?) in
            closure(items, error)
        }
    }

    public func findProductPrice(priceProduct: PriceProduct, closure: @escaping (PriceValueSM?, ErrorSM?) -> Swift.Void) {
        
        let filter = PriceConfigurationFilter()
        filter.addProduct(priceProduct: priceProduct)
        
        let data = filter.getData()
        var params: [String: String] = [:]
        
        params["filters"] = data
        
        let url = client!.getGatewayUrl() + getURI()

        heandler.request(url: url, method: .post, parameters: params) { (items: PriceValueSM?, error: ErrorSM?) in
            closure(items, error)
        }
    }
    
    @available(*, unavailable, message: "Method get() can not be use with correlations")
    public override func get(id: String, closure: @escaping SMResponse<PriceValueSM>) {}
    
    @available(*, unavailable, message: "Method create() can not be use with correlations")
    public override func create(data: [String: String], closure: @escaping SMResponse<PriceValueSM>) {}
    
    @available(*, unavailable, message: "Method update() can not be use with correlations")
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<PriceValueSM>) {}
    
    @available(*, unavailable, message: "Method delete() can not be use with correlations")
    public override func delete(id: String, closure: @escaping SMResponseDelete) {}
}
